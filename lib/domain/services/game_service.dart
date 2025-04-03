import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../bloc/game_bloc.dart';
import '../models/game_state.dart';
import '../models/player.dart';

class GameService {
  final GptRepository repository;

  GameService(this.repository);

  bool canSkipStage(RunningGameState gameState) {
    bool result = false;
    if (gameState.stage == GameStage.intro ||
        gameState.stage == GameStage.roundStarted ||
        gameState.stage == GameStage.speaking) {
      result = true;
    }
    return result;
  }

  GameState skipStage(RunningGameState gameState) {
    switch (gameState.stage) {
      case GameStage.intro:
        return gameState.copyWith(stage: GameStage.roundStarted);
      case GameStage.roundStarted:
        return gameState.copyWith(stage: GameStage.openCards);
      case GameStage.speaking:
        return gameState.copyWith(stage: GameStage.voting);
      default:
        // TODO: логировать, непредвиденная стадия, которую нельзя просто скипнуть
        return gameState;
    }
  }

  GameState getStateAfterVoteResult(RunningGameState gameState) {
    if (gameState.stage != GameStage.voteResult) {
      // TODO: логировать, неожиданный вызов функции
      return gameState;
    }

    if (gameState.voteInfo.voteStatus == VoteStatus.successful) {
      final roundNumber = gameState.roundInfo.roundNumber;

      if (roundNumber >= 5) {
        return gameState.copyWith(stage: GameStage.preFinalLoading);
      } else {
        final playersCount = gameState.settings.playersCount;
        final roundInfo = getRoundInfo(roundNumber + 1, playersCount);

        const voteInfo = VoteInfo(
          votes: [],
          canBeSelected: [],
          selectedIndexes: [],
          voteStatus: VoteStatus.none,
        );

        return gameState.copyWith(
          stage: GameStage.roundStarted,
          roundInfo: roundInfo,
          voteInfo: voteInfo,
        );
      }
    } else {
      // Переголосование
      return gameState.copyWith(stage: GameStage.speaking);
    }
  }

  Future<GameState> getFinalState(RunningGameState preFinalState) async {
    final settings = preFinalState.settings;
    final disaster = preFinalState.disaster;
    final alive = preFinalState.alive;
    final kicked = preFinalState.kicked;

    final finals =
        await repository.getFinale(settings, disaster, alive, kicked);

    return preFinalState.copyWith(stage: GameStage.finals, finals: finals);
  }

  RunningGameState updateProperties(
      OpenedPropertyGameEvent event, RunningGameState gameState) {
    final playerIndex = gameState.currentPlayerIndex;
    final knownProperties =
        List.of(gameState.players[playerIndex].knownProperties);

    for (var index in event.propertyIndexes) {
      knownProperties[index] = true;
    }

    final players = List.of(gameState.players);
    players[playerIndex] =
        players[playerIndex].copyWith(knownProperties: knownProperties);

    return gameState.copyWith(players: players);
  }

  int nextAlive(List<Player> players, int start) {
    return players.indexWhere(
        (player) => player.lifeStatus == LifeStatus.alive, start);
  }

  int nextVoting(List<Player> players, int start) {
    return players.indexWhere(
        (player) => player.lifeStatus != LifeStatus.killed, start);
  }

  RunningGameState nextRound(RunningGameState gameState) {
    final playersCount = gameState.settings.playersCount;
    final roundNumber = gameState.roundInfo.roundNumber;
    final currentPlayerIndex = nextAlive(gameState.players, 0);

    return gameState.copyWith(
      roundInfo: getRoundInfo(roundNumber + 1, playersCount),
      currentPlayerIndex: currentPlayerIndex,
      stage: GameStage.roundStarted,
    );
  }

  RunningGameState startVoting(RunningGameState gameState) {
    final playerIndex = nextVoting(gameState.players, 0);

    // Могут быть выбраны только живые игроки
    final canBeSelected = gameState.players
        .map((player) => player.lifeStatus == LifeStatus.alive)
        .toList();

    final voteInfo = VoteInfo(
      votes: List.filled(gameState.settings.playersCount, 0),
      canBeSelected: canBeSelected,
      selectedIndexes: [],
      voteStatus: VoteStatus.running,
    );

    return gameState.copyWith(
      currentPlayerIndex: playerIndex,
      stage: GameStage.speaking,
      voteInfo: voteInfo,
    );
  }
}
