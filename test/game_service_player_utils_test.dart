import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/services/game_service.dart';

import 'test_utils.dart';

void main() {
  late GameService gameService;
  late MockGptRepository mockRepository;
  late List<Player> testPlayers;

  setUpAll(() {
    registerFallbackValue(FakeGameSettings());
    registerFallbackValue(FakeDisaster());
    registerFallbackValue(FakePlayer());
    registerFallbackValue(<Player>[]);
  });

  setUp(() {
    mockRepository = MockGptRepository();
    gameService = GameService(mockRepository);
    testPlayers = createTestPlayers();
  });

  test('nextAlive finds next alive player correctly', () {
    final index = gameService.nextAlive(testPlayers, 0);
    expect(index, equals(0)); // First player is alive
  });

  test('nextVoting finds next eligible voter correctly', () {
    final index = gameService.nextVoting(testPlayers, 0);
    expect(index, equals(0)); // First player can vote
  });
}
