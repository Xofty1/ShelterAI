import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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

  test('getStateAfterVoteResult handles successful vote correctly', () {
    final voteInfo = VoteInfo(
      votes: [3, 2, 0, 0, 0],
      canBeSelected: List.filled(5, true),
      selectedIndexes: [0],
      voteStatus: VoteStatus.successful,
    );

    final voteResultState = baseState.copyWith(
      stage: GameStage.voteResult,
      voteInfo: voteInfo,
    );
    
    final result = gameService.getStateAfterVoteResult(voteResultState);
    
    expect(result.stage, equals(GameStage.roundStarted));
    expect((result as RunningGameState).roundInfo.roundNumber, equals(2));
  });

  group('GameService.getStateAfterVoteResult', () {
    late RunningGameState voteResultState;

    setUp(() {
      final voteInfo = VoteInfo(
        votes: [3, 2, 0, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [0],
        voteStatus: VoteStatus.successful,
      );

      voteResultState = baseState.copyWith(
        stage: GameStage.voteResult,
        voteInfo: voteInfo,
      );
    });

    test('returns same state if not in voteResult stage', () {
      final state = baseState.copyWith(stage: GameStage.voting);
      final result = gameService.getStateAfterVoteResult(state);
      expect(result, equals(state));
    });

    test('moves to next round if vote was successful and not final round', () {
      final result = gameService.getStateAfterVoteResult(voteResultState);

      expect(result.stage, equals(GameStage.roundStarted));
      expect((result as RunningGameState).roundInfo.roundNumber, equals(2));
      expect(result.voteInfo.voteStatus, equals(VoteStatus.none));
    });

    test('moves to preFinalLoading if vote was successful and final round', () {
      final finalRoundInfo = getRoundInfo(5, 5);
      final finalRoundState =
          voteResultState.copyWith(roundInfo: finalRoundInfo);

      final result = gameService.getStateAfterVoteResult(finalRoundState);

      expect(result.stage, equals(GameStage.preFinalLoading));
    });

    test('moves to speaking stage if vote was not successful', () {
      final rerunningVoteInfo =
          voteResultState.voteInfo.copyWith(voteStatus: VoteStatus.reRunning);
      final rerunningState =
          voteResultState.copyWith(voteInfo: rerunningVoteInfo);

      final result = gameService.getStateAfterVoteResult(rerunningState);

      expect(result.stage, equals(GameStage.speaking));
    });
  });
}
