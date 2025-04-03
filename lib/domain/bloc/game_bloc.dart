import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair/pair.dart';
import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../models/game_settings.dart';
import '../models/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GptRepository repository;

  GameBloc(this.repository) : super(const GameState(stage: GameStage.waiting)) {
    on<StartedGameEvent>(_onStarted);
    on<ReadyGameEvent>(_onReady);
    on<OpenedPropertyGameEvent>(_onOpenedProperty);
    on<VotedGameEvent>(_onVoted);

    on<WaitingGameEvent>(_onWaiting);
  }

  void _onStarted(StartedGameEvent event, Emitter emit) {
    emit(RunningGameState.initial(
        settings: event.settings,
        disaster: event.disaster,
        players: event.players));
  }

  Future<void> _onReady(ReadyGameEvent event, Emitter emit) async {
    final prevState = (state as RunningGameState);
    GameStage stage = prevState.stage;
    VoteInfo voteInfo = prevState.voteInfo;

    switch (stage) {
      // Переходим на следующую стадию, на следующей стадии предпросмотр
      case GameStage.intro:
        stage = GameStage.roundStarted;
      // Переходим на следующую стадию, на следующей стадии предпросмотр
      case GameStage.roundStarted:
        stage = GameStage.openCards;
      // Переходим на следующую стадию, предпросмотр
      case GameStage.speaking:
        stage = GameStage.voting;
      // Тут разветвление в зависимости от результатов голосования
      case GameStage.voteResult:
        if (voteInfo.voteStatus == VoteStatus.successful) {
          // Если указан 6 раунд, значит игра окончена, иначе идет объявление
          // нового раунда
          stage = prevState.roundInfo.roundNumber < 6
              ? GameStage.roundStarted
              : GameStage.preFinalLoading;
          voteInfo = const VoteInfo(
              votes: [],
              canBeSelected: [],
              selectedIndexes: [],
              voteStatus: VoteStatus.none);
        } else {
          stage = GameStage.speaking;
        }
      default:
        break;
    }

    emit(prevState.copyWith(
      stage: stage,
      voteInfo: voteInfo,
    ));

    if (stage == GameStage.preFinalLoading) {
      final finalState = await _getFinalState(state as RunningGameState);
      emit(finalState);
    }
  }

  Future<GameState> _getFinalState(RunningGameState preFinalState) async {
    final settings = preFinalState.settings;
    final disaster = preFinalState.disaster;
    final alivePlayers = preFinalState.players
        .where((player) => player.lifeStatus == LifeStatus.alive)
        .toList();
    final kickedPlayers = preFinalState.players
        .where((player) => player.lifeStatus != LifeStatus.alive)
        .toList();

    final finals = await repository.getFinale(
        settings, disaster, alivePlayers, kickedPlayers);

    return preFinalState.copyWith(stage: GameStage.finals, finals: finals);
  }

  void _onOpenedProperty(OpenedPropertyGameEvent event, Emitter emit) {
    final prevState = state as RunningGameState;
    var playerIndex = prevState.currentPlayerIndex;

    final knownProperties =
        List.of(prevState.players[playerIndex].knownProperties);

    for (var index in event.propertyIndexes) {
      knownProperties[index] = true;
    }

    final players = List.of(prevState.players);
    players[playerIndex] =
        players[playerIndex].copyWith(knownProperties: knownProperties);

    // Ищем следущего живого игрока для хода
    playerIndex = players.indexWhere(
        (player) => player.lifeStatus == LifeStatus.alive, playerIndex + 1);

    // Есть живые игроки, не сделавшие ход
    if (playerIndex != -1) {
      emit(prevState.copyWith(
        players: players,
        currentPlayerIndex: playerIndex,
      ));
    }
    // Если кикается ноль игроков - переход к следующему раунду
    else if (prevState.roundInfo.kickedCount == 0) {
      // Ищем первого живого игрока
      playerIndex =
          players.indexWhere((player) => player.lifeStatus == LifeStatus.alive);

      emit(prevState.copyWith(
        players: players,
        currentPlayerIndex: playerIndex,
        roundInfo: getRoundInfo(prevState.roundInfo.roundNumber + 1,
            prevState.settings.playersCount),
        stage: GameStage.roundStarted,
      ));
    }
    // Все хорошо, переход к голосованию
    else {
      // Ищем первого голосующего игрока
      playerIndex = players
          .indexWhere((player) => player.lifeStatus != LifeStatus.killed);

      // Могут быть выбраны только живые игроки
      final canBeSelected = players
          .map((player) => player.lifeStatus == LifeStatus.alive)
          .toList();

      final voteInfo = VoteInfo(
        votes: List.filled(prevState.settings.playersCount, 0),
        canBeSelected: canBeSelected,
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );

      emit(prevState.copyWith(
        players: players,
        currentPlayerIndex: playerIndex,
        stage: GameStage.speaking,
        voteInfo: voteInfo,
      ));
    }
  }

  void _onWaiting(WaitingGameEvent event, Emitter emit) {
    final prevState = state as RunningGameState;


  }

  void _onVoted(VotedGameEvent event, Emitter emit) {
    final prevState = state as RunningGameState;

    final votes = List.of(prevState.voteInfo.votes);
    votes[event.voteIndex]++;

    var playerIndex = prevState.players.indexWhere(
        (player) => player.lifeStatus != LifeStatus.killed,
        prevState.currentPlayerIndex + 1);
    // Голосует следующий игрок
    if (playerIndex != -1) {
      emit(prevState.copyWith(
        voteInfo: prevState.voteInfo.copyWith(votes: votes),
        currentPlayerIndex: playerIndex,
      ));
    }
    // Переголосование/результаты голосования
    else {
      final sortedVotes = _getSortedVotes(votes);
      final lastKicking = prevState.roundInfo.kickedCount - 1;

      // В отсортированном массиве последний кикаемый игрок должен
      // иметь большее количество голосов, чем следующий после него.

      // Успешный результат голосования
      if (sortedVotes[lastKicking].value > sortedVotes[lastKicking + 1].value) {
        // Получаем кикнутых игроков
        final selectedIndexes = sortedVotes
            .getRange(0, lastKicking + 1)
            .map((element) => element.key)
            .toList();

        final players = List.of(prevState.players);

        // Меняем статус жизни персонажей: last -> killed,
        // У выбранных персонажей alive -> last
        for (int i = 0; i < players.length; i++) {
          if (players[i].lifeStatus == LifeStatus.killed) {
            players[i] = players[i].copyWith(lifeStatus: LifeStatus.killed);
          } else if (selectedIndexes.contains(i)) {
            players[i] = players[i].copyWith(lifeStatus: LifeStatus.last);
          }
        }

        emit(prevState.copyWith(
          players: players,
          stage: GameStage.voteResult,
          roundInfo: getRoundInfo(prevState.roundInfo.roundNumber + 1,
              prevState.settings.playersCount),
          voteInfo: prevState.voteInfo.copyWith(
            selectedIndexes: selectedIndexes,
            voteStatus: VoteStatus.successful,
          ),
          currentPlayerIndex: players
              .indexWhere((player) => player.lifeStatus == LifeStatus.alive),
        ));
      }
      // Переголосование
      else {
        int votesBorder = sortedVotes[lastKicking].value;
        final canBeSelected = votes.map((vote) => vote >= votesBorder).toList();

        emit(prevState.copyWith(
          stage: GameStage.voteResult,
          voteInfo: prevState.voteInfo.copyWith(
            voteStatus: VoteStatus.reRunning,
            votes: List.filled(prevState.settings.playersCount, 0),
            canBeSelected: canBeSelected,
            selectedIndexes: [],
          ),
          currentPlayerIndex: prevState.players
              .indexWhere((player) => player.lifeStatus != LifeStatus.killed),
        ));
      }
    }
  }

  // Получение отсортированных голосов
  // Ключ - индекс игрока, значение - количество голосов
  List<Pair<int, int>> _getSortedVotes(List<int> votes) {
    return List.generate(votes.length, (index) => Pair(index, votes[index]))
      ..sort((a, b) => b.value.compareTo(a.value));
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


class WaitingGameEvent extends GameEvent {
  WaitingGameEvent(this.isHost);

  final bool isHost;
}
