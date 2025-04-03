import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
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

  group('GameService.canSkipStage', () {
    test('returns true for intro stage', () {
      final state = baseState.copyWith(stage: GameStage.intro);
      expect(gameService.canSkipStage(state), isTrue);
    });

    test('returns true for roundStarted stage', () {
      final state = baseState.copyWith(stage: GameStage.roundStarted);
      expect(gameService.canSkipStage(state), isTrue);
    });

    test('returns true for speaking stage', () {
      final state = baseState.copyWith(stage: GameStage.speaking);
      expect(gameService.canSkipStage(state), isTrue);
    });

    test('returns false for other stages', () {
      final openCardsState = baseState.copyWith(stage: GameStage.openCards);
      final votingState = baseState.copyWith(stage: GameStage.voting);
      final voteResultState = baseState.copyWith(stage: GameStage.voteResult);

      expect(gameService.canSkipStage(openCardsState), isFalse);
      expect(gameService.canSkipStage(votingState), isFalse);
      expect(gameService.canSkipStage(voteResultState), isFalse);
    });
  });

  group('GameService.skipStage', () {
    test('changes intro stage to roundStarted stage', () {
      final state = baseState.copyWith(stage: GameStage.intro);
      final result = gameService.skipStage(state);
      expect(result.stage, equals(GameStage.roundStarted));
    });

    test('changes roundStarted stage to openCards stage', () {
      final state = baseState.copyWith(stage: GameStage.roundStarted);
      final result = gameService.skipStage(state);
      expect(result.stage, equals(GameStage.openCards));
    });

    test('changes speaking stage to voting stage', () {
      final state = baseState.copyWith(stage: GameStage.speaking);
      final result = gameService.skipStage(state);
      expect(result.stage, equals(GameStage.voting));
    });

    test('returns same state for non-skippable stage', () {
      final state = baseState.copyWith(stage: GameStage.voting);
      final result = gameService.skipStage(state);
      expect(result, equals(state));
    });
  });
}
