import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/data/entities/room/room.dart';

class FirebaseRepository {
  final FirebaseFirestore _firestore;
  final String _roomsCollection = 'rooms';
  final String _playersCollection = 'players';

  // Приватный конструктор
  FirebaseRepository._internal(this._firestore);

  // Единственный экземпляр
  static final FirebaseRepository _instance =
      FirebaseRepository._internal(FirebaseFirestore.instance);

  // Фабричный конструктор, возвращающий _instance
  factory FirebaseRepository() => _instance;

  // Вспомогательный метод для сериализации RunningGameState
  Map<String, dynamic> _serializeGameState(RunningGameState gameState) {
    final Map<String, dynamic> gameStateJson = gameState.toJson();

    // Сериализуем все сложные объекты
    gameStateJson['settings'] = gameState.settings.toJson();
    gameStateJson['disaster'] = gameState.disaster.toJson();
    gameStateJson['roundInfo'] = gameState.roundInfo.toJson();
    gameStateJson['voteInfo'] = gameState.voteInfo.toJson();

    // Сериализуем список игроков
    gameStateJson['players'] =
        gameState.players.map((player) => player.toJson()).toList();

    return gameStateJson;
  }

  // Вспомогательный метод для сериализации Room
  Map<String, dynamic> _serializeRoom(Room room) {
    return {
      'gameState': _serializeGameState(room.gameState),
      'password': room.password,
      'currentPlayerIndex': room.currentPlayerIndex,
      'currentPlayerCounter': room.currentPlayerCounter,
    };
  }

  // Create a new room
  Future<String> createRoom(Room room) async {
    final Map<String, dynamic> roomData = _serializeRoom(room);
    final docRef = await _firestore.collection(_roomsCollection).add(roomData);
    return docRef.id;
  }

  // Join a room
  Future<void> joinRoom(String roomId, Player player) async {
    await _firestore // поменять логику присоединения в комнату
        .collection(_roomsCollection)
        .doc(roomId)
        .collection(_playersCollection)
        .doc(player.id.toString())
        .set(player.toJson());
  }

  // Update game state
  Future<void> updateGameState(
      String roomId, RunningGameState gameState) async {
    final Map<String, dynamic> gameStateJson = _serializeGameState(gameState);

    await _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .update({'gameState': gameStateJson});
  }

  // Stream of room updates
  Stream<Room?> watchRoom(String roomId) {
    return _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .snapshots()
        .map((doc) => doc.exists ? Room.fromJson(doc.data()!) : null);
  }

  // Stream of players in a room
  Stream<List<Player>> watchPlayers(String roomId) {
    return _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .collection(_playersCollection)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Player.fromJson(doc.data())).toList());
  }

  // Get room by ID
  Future<Room?> getRoom(String roomId) async {
    final doc = await _firestore.collection(_roomsCollection).doc(roomId).get();
    return doc.exists ? Room.fromJson(doc.data()!) : null;
  }

  // Get players in a room
  Future<List<Player>> getPlayers(String roomId) async {
    final snapshot = await _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .collection(_playersCollection)
        .get();
    return snapshot.docs.map((doc) => Player.fromJson(doc.data())).toList();
  }

  // Leave room
  Future<void> leaveRoom(String roomId, String playerId) async {
    await _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .collection(_playersCollection)
        .doc(playerId)
        .delete();
  }

  // Delete room
  Future<void> deleteRoom(String roomId) async {
    await _firestore.collection(_roomsCollection).doc(roomId).delete();
  }

  // Update player status
  Future<void> updatePlayerStatus(
    String roomId,
    String playerId,
    bool isReady,
  ) async {
    await _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .collection(_playersCollection)
        .doc(playerId)
        .update({'isReady': isReady});
  }

  // Update room player counter
  Future<void> updateRoomPlayerCounter(String roomId, int newCount) async {
    await _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .update({'currentPlayerCounter': newCount});
  }
}
