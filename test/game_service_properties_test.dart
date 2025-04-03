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

  test('updateProperties sets correct properties as known', () {
    final propertyIndexes = [0, 2, 4];
    final event = OpenedPropertyGameEvent(propertyIndexes);
    
    final result = gameService.updateProperties(event, baseState);
    
    final updatedPlayer = result.players[baseState.currentPlayerIndex];
    expect(updatedPlayer.knownProperties[0], isTrue);
    expect(updatedPlayer.knownProperties[1], isFalse);
    expect(updatedPlayer.knownProperties[2], isTrue);
  });
}
