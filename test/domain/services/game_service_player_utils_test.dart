import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/services/game_service.dart';

import 'test_utils.dart';

void main() {
  late GameService gameService;
  late MockGptRepository mockRepository;
  late List<Player> testPlayers;
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
    testPlayers = createTestPlayers();
    baseState = createBaseGameState();
  });

  group('GameService.nextAlive', () {
    test('finds next alive player', () {
      final index = gameService.nextAlive(testPlayers, 0);
      expect(index, equals(0)); // First player is alive

      final nextIndex = gameService.nextAlive(testPlayers, 1);
      expect(nextIndex, equals(1)); // Second player is alive

      final lastAliveIndex = gameService.nextAlive(testPlayers, 3);
      expect(
          lastAliveIndex, equals(-1)); // No alive players from index 3 onwards
    });

    test('returns -1 when no alive players found', () {
      final allDeadPlayers = testPlayers
          .map((p) => p.copyWith(lifeStatus: LifeStatus.killed))
          .toList();

      final index = gameService.nextAlive(allDeadPlayers, 0);
      expect(index, equals(-1));
    });
  });

  group('GameService.nextVoting', () {
    test('finds next player eligible for voting', () {
      final index = gameService.nextVoting(testPlayers, 0);
      expect(index, equals(0)); // First player can vote

      final lastIndex = gameService.nextVoting(testPlayers, 4);
      expect(lastIndex, equals(-1)); // No eligible voters from index 4 onwards

      // Even players with 'last' status can vote
      final lastPlayerIndex = gameService.nextVoting(testPlayers, 3);
      expect(lastPlayerIndex, equals(3));
    });

    test('returns -1 when no eligible voters found', () {
      final allKilledPlayers = testPlayers
          .map((p) => p.copyWith(lifeStatus: LifeStatus.killed))
          .toList();

      final index = gameService.nextVoting(allKilledPlayers, 0);
      expect(index, equals(-1));
    });
  });
}
