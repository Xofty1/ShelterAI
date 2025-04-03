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

  test('getFinalState fetches finale correctly', () async {
    when(() => mockRepository.getFinale(any(), any(), any(), any()))
        .thenAnswer((_) async => 'Test finale text');

    final preFinalState = baseState.copyWith(stage: GameStage.preFinalLoading);
    final result = await gameService.getFinalState(preFinalState);

    expect(result.stage, equals(GameStage.finals));
    expect((result as RunningGameState).finals, equals('Test finale text'));
    verify(() => mockRepository.getFinale(any(), any(), any(), any()))
        .called(1);
  });
}
