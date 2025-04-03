import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/bloc/game_bloc.dart';
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

  group('GameService.updateProperties', () {
    test('updates properties for current player', () {
      final propertyIndexes = [0, 2, 4];
      final event = OpenedPropertyGameEvent(propertyIndexes);

      final result = gameService.updateProperties(event, baseState);

      // Check that properties were updated for current player
      final updatedPlayer = result.players[baseState.currentPlayerIndex];
      expect(updatedPlayer.knownProperties[0], isTrue);
      expect(updatedPlayer.knownProperties[1], isFalse);
      expect(updatedPlayer.knownProperties[2], isTrue);
      expect(updatedPlayer.knownProperties[3], isFalse);
      expect(updatedPlayer.knownProperties[4], isTrue);
      expect(updatedPlayer.knownProperties[5], isFalse);

      // Check other players are unchanged
      for (int i = 0; i < result.players.length; i++) {
        if (i != baseState.currentPlayerIndex) {
          expect(result.players[i].knownProperties, everyElement(isFalse));
        }
      }
    });
  });
}
