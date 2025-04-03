import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/room.dart';

class FirebaseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _roomsCollection = 'rooms';
  final String _playersCollection = 'players';

  // Create a new room
  Future<String> createRoom(Room room) async {
    final docRef =
        await _firestore.collection(_roomsCollection).add(room.toJson());
    return docRef.id;
  }

  // Join a room
  Future<void> joinRoom(String roomId, Player player) async {
    await _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .collection(_playersCollection)
        .doc(player.id.toString())
        .set(player.toJson());
  }

  // Update game state
  Future<void> updateGameState(String roomId, RunningGameState gameState) async {
    await _firestore
        .collection(_roomsCollection)
        .doc(roomId)
        .update({'gameState': gameState.toJson()});
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
}
