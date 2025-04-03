import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/data/repositories/firebase_repository.dart';
import 'package:shelter_ai/domain/models/firebase_room/firebase_room.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../models/disaster.dart';
import '../models/game_settings.dart';
import '../models/player.dart';
import '../models/game_state.dart';
import '../../data/entities/room/room.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  GptRepository gptRepository;
  FirebaseRepository firebaseRepository;

  GameSettingsCubit(this.gptRepository, this.firebaseRepository)
      : super(const GameSettingsState.initial());

  String _generateRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ));
  }

  void updatePlayersCount(int newCount) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(playersCount: newCount)),
    );
  }

  void updateDifficulty(int newDifficulty) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(difficulty: newDifficulty)),
    );
  }

  void updatePlot(String value) {
    emit(
      GameSettingsState(settings: state.settings.copyWith(plot: value)),
    );
  }

  void updateSafeMode(bool newMode) {
    emit(
      GameSettingsState(settings: state.settings.copyWith(safeMode: newMode)),
    );
  }

  void updateTime(int newTime) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(
        time: newTime,
      )),
    );
  }

  Future<void> startGame(String language) async {
    emit(DisasterLoadingState(
      settings: state.settings.copyWith(language: language),
    ));

    try {
      final map = await gptRepository.createGame(state.settings);
      final Disaster disaster = map['disaster'] as Disaster;
      final players = map['player_list'] as List<Player>;

      if (state.settings.isOnline) {
        // Create initial game state
        final gameState = RunningGameState.initial(
          settings: state.settings,
          disaster: disaster,
          players: players,
        ).copyWith(stage: GameStage.waitingPlayers);

        // Generate room password
        final password = _generateRandomString(4);

        // Create room in Firebase
        final roomId = await firebaseRepository.createRoom(
          Room(
            gameState: gameState,
            currentPlayerCounter: 1,
            currentPlayerIndex: 0,
            password: password,
            isBusy:
                List.generate(state.settings.playersCount, (index) => false),
          ),
        );

        // Join room with first player
        final playerId = await firebaseRepository
            .joinRoom(roomId); // это id игрока под которым играет пользователь

        // Обновляем игрока с полученным ID
        final updatedPlayer = players[0].copyWith(id: playerId);
        final updatedPlayers = [...players];
        updatedPlayers[0] = updatedPlayer;

        // Include roomId in the emitted state
        emit(OnlineDisasterUploadedState(
          settings: state.settings,
          gameState: gameState.copyWith(players: updatedPlayers),
          room: FirebaseRoom(
            isHost: true,
            playerId: playerId,
            roomId: roomId,
          ),
        ));
      } else {
        // For offline mode
        emit(DisasterUploadedState(
          settings: state.settings,
          disaster: disaster,
          players: players,
        ));
      }
    } catch (e) {
      print("startGame $e");
      emit(ErrorLoadingGameState(settings: state.settings));
    }
  }

  void updateIsOnline(bool newIsOnline) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(
        isOnline: newIsOnline,
      )),
    );
  }
}

class GameSettingsState {
  const GameSettingsState({required this.settings});

  const GameSettingsState.initial()
      : settings = const GameSettings(
          playersCount: 5,
          difficulty: 2,
          plot: '',
          safeMode: false,
          language: 'ru',
          time: 30,
          isOnline: false,
        );

  final GameSettings settings;
}

class DisasterLoadingState extends GameSettingsState {
  DisasterLoadingState({required super.settings});
}

class ErrorLoadingGameState extends GameSettingsState {
  ErrorLoadingGameState({required super.settings});
}

class DisasterUploadedState extends GameSettingsState {
  final Disaster disaster;
  final List<Player> players;
  final String? roomId;
  final String? roomPassword;

  DisasterUploadedState({
    required super.settings,
    required this.disaster,
    required this.players,
    this.roomId,
    this.roomPassword,
  });
}

class OnlineDisasterUploadedState extends GameSettingsState {
  final FirebaseRoom room;
  final RunningGameState gameState;

  OnlineDisasterUploadedState({
    required super.settings,
    required this.gameState,
    required this.room,
  });
}

// Add new states for room joining
class JoiningRoomState extends GameSettingsState {
  JoiningRoomState({required super.settings});
}

class RoomNotFoundState extends GameSettingsState {
  RoomNotFoundState({required super.settings});
}

class InvalidPasswordState extends GameSettingsState {
  InvalidPasswordState({required super.settings});
}

class RoomFullState extends GameSettingsState {
  RoomFullState({required super.settings});
}

class ErrorJoiningRoomState extends GameSettingsState {
  ErrorJoiningRoomState({required super.settings});
}

class JoinedRoomState extends GameSettingsState {
  final Disaster disaster;
  final List<Player> players;
  final String roomId;
  final Player currentPlayer;

  JoinedRoomState({
    required super.settings,
    required this.disaster,
    required this.players,
    required this.roomId,
    required this.currentPlayer,
  });
}
