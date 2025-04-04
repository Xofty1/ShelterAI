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

  test('updateVotes increases vote count for selected player', () {
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

  test('reVote resets voting process for tied players', () {
    final voteInfo = VoteInfo(
      votes: [2, 2, 1, 0, 0],
      canBeSelected: List.filled(5, true),
      selectedIndexes: [],
      voteStatus: VoteStatus.running,
    );

    const roundInfo = RoundInfo(roundNumber: 3, kickedCount: 1, openCount: 1);

    final state = baseState.copyWith(voteInfo: voteInfo, roundInfo: roundInfo);
    final result = gameService.reVote(state);

    expect(result.stage, equals(GameStage.voteResult));
    expect(result.voteInfo.voteStatus, equals(VoteStatus.reRunning));
  });
}
