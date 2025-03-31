import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair/pair.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../models/game_settings.dart';
import '../models/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GPTRepository repository;

  GameBloc(this.repository,) : super(const LoadingGameState()) {
    on<StartedGameEvent>(_onStarted);
    on<ReadyGameEvent>(_onReady);
    on<OpenedPropertyGameEvent>(_onOpenedProperty);
    on<VotedGameEvent>(_onVoted);
  }

  Future<void> _onStarted(StartedGameEvent event, Emitter emit) async {
    emit(const LoadingGameState());

    final disaster = await repository.getDisaster(event.settings);
    final players = await repository.getPlayers(event.settings);
    final roundInfo = getRoundInfo(1, players.length);

    emit(RunningGameState(
      settings: event.settings,
      disaster: disaster,
      players: players,
      stage: GameStage.intro,
      voteInfo: VoteInfo(
        votes: List.filled(players.length, 0),
        canBeSelected: List.filled(players.length, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.none,
      ),
      roundInfo: roundInfo,
      currentPlayerIndex: 0,
    ));
  }

  void _onReady(ReadyGameEvent event, Emitter emit) {
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
              : GameStage.finals;
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
  }

  void _onOpenedProperty(OpenedPropertyGameEvent event, Emitter emit) {
    final prevState = state as RunningGameState;
    var playerIndex = prevState.currentPlayerIndex;

    final knownProperties =
    List.of(prevState.players[playerIndex].knownProperties);
    print('event length: ${event.propertyIndexes.length}');
    for (var index in event.propertyIndexes) {
      knownProperties[index] = true;
    }

    final players = List.of(prevState.players);
    players[playerIndex] =
        players[playerIndex].copyWith(knownProperties: knownProperties);

    playerIndex = players. indexWhere(
            (player) => player.lifeStatus == LifeStatus.alive, playerIndex + 1);

    // Есть живые игроки, не сделавшие ход
    if (playerIndex != -1) {
      emit(prevState.copyWith(
        players: players,
        currentPlayerIndex: playerIndex,
      ));
      print('Player 0: ${players.first.knownProperties[0]}');
    } else {
      // Ищем первого голосующего игрока
      playerIndex =
          players.indexWhere((player) => player.lifeStatus == LifeStatus.alive);

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
    } else {
      final sortedVotes = _getSortedVotes(votes);
      final lastKicking = prevState.roundInfo.kickedCount - 1;

      // В отсортированном массиве последний кикаемый игрок должен
      // иметь большее количество голосов, чем следующий после него.
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
          roundInfo: getRoundInfo(
              prevState.roundInfo.roundNumber + 1, prevState.settings.playersCount),
          voteInfo: prevState.voteInfo.copyWith(
            selectedIndexes: selectedIndexes,
            voteStatus: VoteStatus.successful,
          ),
          currentPlayerIndex: players
              .indexWhere((player) => player.lifeStatus == LifeStatus.alive),
        ));
      } else {
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
  StartedGameEvent(this.settings);

  final GameSettings settings;
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
