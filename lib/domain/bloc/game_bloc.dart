import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair/pair.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../models/game_settings.dart';
import '../models/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState>{

  final GPTRepository repository;

  GameBloc(this.repository
      ) : super(const LoadingGameState()) {
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
            isPreview: true,
            stage: GameStage.intro,
            voteInfo: VoteInfo(
                votes: List.filled(players.length, 0),
                canBeSelected: List.filled(players.length, true),
                selectedIndexes: [],
                voteStatus: VoteStatus.none,
            ),
            roundInfo: roundInfo,
            actionsTaken: 0,
            currentPlayerIndex: 0,
    ));
  }

  void _onReady(ReadyGameEvent event, Emitter emit) {
    final prevState = (state as RunningGameState);
    GameStage stage = prevState.stage;
    bool isPreview = false;
    VoteInfo voteInfo = prevState.voteInfo;

    switch(stage){
      // Переходим на следующую стадию, на следующей стадии предпросмотр
      case GameStage.intro:
        stage = GameStage.roundStarted;
        isPreview = true;

      // Переходим на следующую стадию, на следующей стадии предпросмотр
      case GameStage.roundStarted:
        stage = GameStage.openCards;
        isPreview = true;

      // Остаемся на той же стадии, но отключаем предпросмотр
      case GameStage.openCards:
        stage = GameStage.openCards;
        isPreview = false;

      // Переходим на следующую стадию, предпросмотр
      case GameStage.speaking:
        stage = GameStage.voting;
        isPreview = true;

      // Выключаем предпросмотр
      case GameStage.voting:
        stage = GameStage.voting;
        isPreview = false;

      // Тут разветвление в зависимости от результатов голосования
      case GameStage.voteResult:
        if(voteInfo.voteStatus == VoteStatus.successful){
          // Если указан 6 раунд, значит игра окончена, иначе идет объявление
          // нового раунда
          stage = prevState.roundInfo.roundNumber < 6
              ? GameStage.roundStarted
              : GameStage.finals;
          isPreview = true;
          voteInfo = const VoteInfo(
            votes: [],
            canBeSelected: [],
            selectedIndexes: [],
            voteStatus: VoteStatus.none
          );
        } else{
          stage = GameStage.speaking;
          isPreview = true;
        }

      default: throw Exception('Unexpected event');
    }

    emit(prevState.copyWith(
        stage: stage,
        isPreview: isPreview,
        voteInfo: voteInfo
    ));
  }

  void _onOpenedProperty(OpenedPropertyGameEvent event, Emitter emit){
    final prevState = state as RunningGameState;
    var playerIndex = prevState.currentPlayerIndex;

    final knownProperties = List.of(prevState.players[playerIndex].knownProperties);
    knownProperties[event.propertyIndex] = true;

    final players = List.of(prevState.players);
    players[playerIndex] = players[playerIndex]
        .copyWith(knownProperties: knownProperties);

    var actionsTaken = prevState.actionsTaken + 1;

    // Если количество вскрытых характеристик равно целевому в этом раунде
    if(actionsTaken >= prevState.roundInfo.openCount){
      actionsTaken = 0;
      playerIndex = players.indexWhere(
              (player) => player.lifeStatus == LifeStatus.alive, playerIndex);

      // Есть живые игроки, не сделавшие ход
      if(playerIndex != -1){
        emit(prevState.copyWith(
          players: players,
          actionsTaken: actionsTaken,
          currentPlayerIndex: playerIndex,
          isPreview: true,
        ));
      } else{
        // Ищем первого голосующего игрока
        playerIndex = players.indexWhere(
                (player) => player.lifeStatus == LifeStatus.alive);

        // Могут быть выбраны только живые игроки
        final canBeSelected = players
            .map((player) => player.lifeStatus == LifeStatus.alive).toList();

        final voteInfo = VoteInfo(
            votes: List.filled(prevState.settings.playersCount, 0),
            canBeSelected: canBeSelected,
            selectedIndexes: [],
            voteStatus: VoteStatus.running
        );

        emit(prevState.copyWith(
          players: players,
          actionsTaken: actionsTaken,
          currentPlayerIndex: playerIndex,
          isPreview: true,
          stage: GameStage.speaking,
          voteInfo: voteInfo,
        ));
      }
    } else{
      emit(prevState.copyWith(
        players: players,
        actionsTaken: actionsTaken
      ));
    }
  }

  void _onVoted(VotedGameEvent event, Emitter emit){
    final prevState = state as RunningGameState;

    final votes = List.of(prevState.voteInfo.votes);
    votes[event.voteIndex]++;

    var playerIndex = prevState.players.indexWhere(
          (player) => player.lifeStatus != LifeStatus.killed, prevState.currentPlayerIndex);

    // Голосует следующий игрок
    if(playerIndex != -1){
      emit(prevState.copyWith(
        voteInfo: prevState.voteInfo.copyWith(votes: votes),
        currentPlayerIndex: playerIndex,
        isPreview: true,
      ));
    } else{

      final sortedVotes = _getSortedVotes(votes);
      final lastKicking = prevState.roundInfo.kickedCount - 1;

      // В отсортированном массиве последний кикаемый игрок должен
      // иметь большее количество голосов, чем следующий после него.
      if(sortedVotes[lastKicking].value > sortedVotes[lastKicking + 1].value){

        // Получаем кикнутых игроков
        final selectedIndexes = sortedVotes
            .getRange(0, lastKicking)
            .map((element) => element.key)
            .toList();

        final players = List.of(prevState.players);

        // Меняем статус жизни персонажей: last -> killed,
        // У выбранных персонажей alive -> last
        for(int i = 0; i < players.length; i++){
          if(players[i].lifeStatus == LifeStatus.killed){
            players[i] = players[i].copyWith(lifeStatus: LifeStatus.killed);
          } else if(selectedIndexes.contains(i)){
            players[i] = players[i].copyWith(lifeStatus: LifeStatus.last);
          }
        }


        emit(prevState.copyWith(
          players: players,
          isPreview: true,
          stage: GameStage.voteResult,
          roundInfo: getRoundInfo(prevState.roundInfo.roundNumber, prevState.settings.playersCount),
          actionsTaken: 0,
          voteInfo: prevState.voteInfo.copyWith(
            selectedIndexes: selectedIndexes,
            voteStatus: VoteStatus.successful,
          ),
          currentPlayerIndex: players
              .indexWhere((player) => player.lifeStatus == LifeStatus.alive),
        ));
      } else{
        // TODO: Переголосование
        int votesBorder = sortedVotes[lastKicking].value;
        final canBeSelected = votes.map((vote) => vote >= votesBorder).toList();

        emit(prevState.copyWith(
          isPreview: true,
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

abstract class GameEvent{}

/// Событие инициализирует загрузку игры
class StartedGameEvent extends GameEvent{
  StartedGameEvent(this.settings);
  final GameSettings settings;
}

// Закрытие информационного этапа
class ReadyGameEvent extends GameEvent{}

// Была вскрыта какая-то характеристика
// Можно вскрывать следующую/запускать ход следующего игрока
// Или запускать голосование, если все игроки сходили
class OpenedPropertyGameEvent extends GameEvent{
  OpenedPropertyGameEvent(this.propertyIndex);
  final int propertyIndex;
}

// Голос отдан
// Можно отобразить, кто голосует следующим
// Или подвести итоги голосования
class VotedGameEvent extends GameEvent{
  VotedGameEvent(this.voteIndex);
  final int voteIndex;
}