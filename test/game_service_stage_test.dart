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

  group('Basic stage transitions', () {
    test('canSkipStage returns correct values for different stages', () {
      expect(gameService.canSkipStage(baseState.copyWith(stage: GameStage.intro)), isTrue);
      expect(gameService.canSkipStage(baseState.copyWith(stage: GameStage.roundStarted)), isTrue);
      expect(gameService.canSkipStage(baseState.copyWith(stage: GameStage.speaking)), isTrue);
      expect(gameService.canSkipStage(baseState.copyWith(stage: GameStage.openCards)), isFalse);
    });

    test('skipStage transitions to correct next stage', () {
      expect(
        gameService.skipStage(baseState.copyWith(stage: GameStage.intro)).stage, 
        equals(GameStage.roundStarted)
      );
      expect(
        gameService.skipStage(baseState.copyWith(stage: GameStage.roundStarted)).stage, 
        equals(GameStage.openCards)
      );
    });
  });
}
