import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/bloc/game_bloc.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
import 'package:shelter_ai/domain/services/game_service.dart';

import 'test_utils.dart';

void main() {
  late GameService gameService;
  late MockGptRepository mockRepository;
  late RunningGameState baseState;

  setUpAll(() {
    registerFallbackValue(FakeGameSettings());
    registerFallbackValue(FakeDisaster());
    registerFallbackValue(FakePlayer());
    registerFallbackValue(<Player>[]);
  });

  setUp(() {
    mockRepository = MockGptRepository();
    gameService = GameService(mockRepository);
    baseState = createBaseGameState();
  });

  group('GameService.updateVotes', () {
    test('increases vote count for selected player', () {
      final voteInfo = VoteInfo(
        votes: [0, 0, 0, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );

      final state = baseState.copyWith(voteInfo: voteInfo);
      final event = VotedGameEvent(2); // Vote for player 3

      final result = gameService.updateVotes(event, state);

      expect(result.voteInfo.votes, equals([0, 0, 1, 0, 0]));
    });
  });

  group('GameService.isVoteSuccess', () {
    test('returns true when vote has clear winner', () {
      final voteInfo = VoteInfo(
        votes: [3, 1, 1, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );

      final state = baseState.copyWith(
        voteInfo: voteInfo,
        roundInfo: getRoundInfo(2, 5), // 1 player to kick
      );

      expect(gameService.isVoteSuccess(state), isTrue);
    });

    test('returns false when vote is tied', () {
      final voteInfo = VoteInfo(
        votes: [2, 2, 1, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );

      final state = baseState.copyWith(
        voteInfo: voteInfo,
        roundInfo: getRoundInfo(2, 5), // 1 player to kick
      );

      expect(gameService.isVoteSuccess(state), isFalse);
    });
  });

  group('GameService.finishVote', () {
    test('updates player statuses and selects kicked players correctly', () {
      final voteInfo = VoteInfo(
        votes: [3, 1, 1, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );

      // Player 3 (index 2) is in "last" status
      final modifiedPlayers = List<Player>.from(createTestPlayers());
      modifiedPlayers[2] =
          modifiedPlayers[2].copyWith(lifeStatus: LifeStatus.last);

      final state = baseState.copyWith(
        players: modifiedPlayers,
        voteInfo: voteInfo,
        roundInfo: getRoundInfo(2, 5), // 1 player to kick
      );

      final result = gameService.finishVote(state);

      // Check player statuses
      expect(result.players[0].lifeStatus,
          equals(LifeStatus.last)); // Most votes, becomes "last"
      expect(result.players[2].lifeStatus,
          equals(LifeStatus.killed)); // Was "last", becomes "killed"
      expect(result.voteInfo.selectedIndexes,
          equals([0])); // Player 1 was selected
      expect(result.voteInfo.voteStatus, equals(VoteStatus.successful));

      // Check that all properties of kicked player are revealed
      expect(result.players[0].knownProperties, everyElement(isTrue));
    });
  });

  group('GameService.reVote', () {
    test('resets voting process for tied players', () {
      final voteInfo = VoteInfo(
        votes: [2, 2, 1, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );

      final state = baseState.copyWith(voteInfo: voteInfo);

      final result = gameService.reVote(state);

      expect(result.stage, equals(GameStage.voteResult));
      expect(result.voteInfo.voteStatus, equals(VoteStatus.reRunning));
      expect(result.voteInfo.votes, List.filled(5, 0)); // Votes reset

      // Only players with 2 or more votes can be selected
      expect(result.voteInfo.canBeSelected,
          equals([true, true, false, false, false]));
      expect(result.voteInfo.selectedIndexes, isEmpty);
    });
  });
}
