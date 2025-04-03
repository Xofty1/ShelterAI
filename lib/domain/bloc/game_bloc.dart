import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair/pair.dart';
import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/firebase_room/firebase_room.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
import 'package:shelter_ai/domain/services/game_service.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';
import 'package:shelter_ai/data/repositories/firebase_repository.dart';

import '../models/game_settings.dart';
import '../models/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameService service;
  final FirebaseRepository? firebaseRepository;
  FirebaseRoom? room;

  GameBloc(this.service, {this.firebaseRepository})
      : super(const GameState(stage: GameStage.waiting)) {
    on<StartedGameEvent>(_onStarted);
    on<ReadyGameEvent>(_onReady);
    on<OpenedPropertyGameEvent>(_onOpenedProperty);
    on<VotedGameEvent>(_onVoted);
    on<EnteredOnlineRoomEvent>(_onEntered);

    // If online mode, listen to room changes
    // if (firebaseRepository != null && room != null) {
    //   _listenToRoomChanges();
    // }
  }

  // Listen to changes in the room
  // void _listenToRoomChanges() {
  //   firebaseRepository!.watchRoom(roomId!).listen((room) {
  //     if (room != null && state is RunningGameState) {
  //       // Only update state if we're not the host or if we're not the current player
  //       if (!isHost ||
  //           (room.gameState.currentPlayerIndex != currentPlayer?.id)) {
  //         emit(room.gameState);
  //       }
  //     }
  //   });
  // }

  // Sync state with Firebase
  // Future<void> _syncState(RunningGameState newState) async {
  //   if (firebaseRepository != null && roomId != null && isHost) {
  //     await firebaseRepository!.updateGameState(roomId!, newState);
  //   }
  // }

  void _onStarted(StartedGameEvent event, Emitter emit) {
    final newState = RunningGameState.initial(
        settings: event.settings,
        disaster: event.disaster,
        players: event.players);

    emit(newState);

    // Sync with Firebase if online
    // if (firebaseRepository != null && roomId != null && isHost) {
    //   _syncState(newState);
    // }
  }

  Future<void> _onReady(ReadyGameEvent event, Emitter emit) async {
    if (state is! RunningGameState) {
      // TODO: логирование
      return;
    }

    final prevState = state as RunningGameState;
    GameState newState = prevState.copyWith();

    // Простой скип стадии
    if (service.canSkipStage(prevState)) {
      newState = service.skipStage(prevState);
      emit(newState);
    } else {
      // Работа с результатом голосования
      if (prevState.stage == GameStage.voteResult) {
        newState = service.getStateAfterVoteResult(prevState);
        emit(newState);
      }

      // Результат голосования может вести к загрузке финала
      if (newState.stage == GameStage.preFinalLoading) {
        final finalState = await service.getFinalState(prevState);
        emit(finalState);
      }
    }

    // Sync with Firebase if online
    // if (newState is RunningGameState &&
    //     firebaseRepository != null &&
    //     roomId != null &&
    //     isHost) {
    //   _syncState(newState as RunningGameState);
    // }
  }

  void _onOpenedProperty(OpenedPropertyGameEvent event, Emitter emit) {
    RunningGameState newState =
        service.updateProperties(event, state as RunningGameState);

    // Ищем следущего живого игрока для хода
    int playerIndex =
        service.nextAlive(newState.players, newState.currentPlayerIndex + 1);

    if (playerIndex != -1) {
      newState = newState.copyWith(currentPlayerIndex: playerIndex);
      emit(newState);
    } else if (newState.roundInfo.kickedCount == 0) {
      newState = service.nextRound(newState);
      emit(newState);
    } else {
      newState = service.startVoting(newState);
      emit(newState);
    }

    // Sync with Firebase if online
    // if (firebaseRepository != null && roomId != null && isHost) {
    //   _syncState(newState);
    // }
  }

  void _onEntered(EnteredOnlineRoomEvent event, Emitter emit) {
    room = event.room;
    emit(event.gameState);
  }

  void _onVoted(VotedGameEvent event, Emitter emit) {
    final prevState = state as RunningGameState;

    RunningGameState newState = service.updateVotes(event, prevState);

    var playerIndex =
        service.nextVoting(newState.players, newState.currentPlayerIndex + 1);

    if (playerIndex != -1) {
      newState = newState.copyWith(currentPlayerIndex: playerIndex);
      emit(newState);
    } else if (service.isVoteSuccess(newState)) {
      newState = service.finishVote(newState);
      emit(newState);
    } else {
      newState = service.reVote(newState);
      emit(newState);
    }

    // Sync with Firebase if online
    // if (firebaseRepository != null && roomId != null && isHost) {
    //   _syncState(newState);
    // }
  }
}

abstract class GameEvent {}

/// Событие инициализирует загрузку игры
class StartedGameEvent extends GameEvent {
  StartedGameEvent(this.settings, this.disaster, this.players);

  final GameSettings settings;
  final Disaster disaster;
  final List<Player> players;
}

// Закрытие информационного этапа
class ReadyGameEvent extends GameEvent {}

// Была вскрыта какая-то характеристика
// Можно вскрывать следующую/запускать ход следующего игрока
// Или запускать голосование, если все игроки сходили
class OpenedPropertyGameEvent extends GameEvent {
  OpenedPropertyGameEvent(this.propertyIndexes);

  final List<int> propertyIndexes;
}

// Голос отдан
// Можно отобразить, кто голосует следующим
// Или подвести итоги голосования
class VotedGameEvent extends GameEvent {
  VotedGameEvent(this.voteIndex);

  final int voteIndex;
}

class EnteredOnlineRoomEvent extends GameEvent {
  EnteredOnlineRoomEvent({
    required this.room,
    required this.gameState,
  });

  final FirebaseRoom room;

  final RunningGameState gameState;
}
