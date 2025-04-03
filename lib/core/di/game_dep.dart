import 'package:shelter_ai/core/di/global_dep.dart';
import '../../domain/bloc/game_bloc.dart';
import '../../domain/services/game_service.dart';
import '../../domain/models/player.dart';

class GameDepHolder {
  GameDepContainer? _container;
  bool _isCreated = false;

  GameDepContainer? get container => _container;
  bool get isCreated => _isCreated;

  void create(GlobalDepContainer globalDepContainer,
      {String? roomId, bool isHost = false, String? playerId = null}) {
    _container = GameDepContainer.inject(globalDepContainer,
        roomId: roomId, isHost: isHost, playerId: playerId);
    _isCreated = true;
  }

  void dispose() {
    if (_container != null) {
      _container!.dispose();
      _container = null;
    }
    _isCreated = false;
  }
}

class GameDepContainer {
  final GameService service;
  final GameBloc gameBloc;
  final String? roomId;
  final bool isHost;

  void dispose() {
    gameBloc.close();
  }

  GameDepContainer._(
      {required this.service,
      required this.gameBloc,
      this.roomId,
      this.isHost = false});

  factory GameDepContainer.inject(GlobalDepContainer container,
      {String? roomId, bool isHost = false, String? playerId}) {
    GameService service = GameService(container.gptRepository);

    // If roomId is provided, we're in online mode
    if (roomId != null) {
      // Get the player data if playerId is provided
      Player? currentPlayer;
      if (playerId != null) {
        // You might need to fetch the player data from Firebase here
        // For now, we'll just create a placeholder
        currentPlayer = Player(
          id: int.parse(playerId),
          name: "Player $playerId",
          profession: "Unknown",
          bio: "Unknown",
          health: "Unknown",
          hobby: "Unknown",
          phobia: "Unknown",
          luggage: "Unknown",
          extra: "Unknown",
          lifeStatus: LifeStatus.alive,
          knownProperties: List.filled(6, false),
          notes: [],
        );
      }

      GameBloc gameBloc = GameBloc(
        service,
        firebaseRepository: container.firebaseRepository,
        roomId: roomId,
        currentPlayer: currentPlayer,
        isHost: isHost,
      );

      return GameDepContainer._(
          service: service, gameBloc: gameBloc, roomId: roomId, isHost: isHost);
    } else {
      // Offline mode
      GameBloc gameBloc = GameBloc(service);
      return GameDepContainer._(service: service, gameBloc: gameBloc);
    }
  }
}
