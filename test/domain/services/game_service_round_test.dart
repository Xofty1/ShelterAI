import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
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

  group('GameService.nextRound', () {
    test('initializes next round with correct data', () {
      final result = gameService.nextRound(baseState);

      expect(result.roundInfo.roundNumber, equals(2));
      expect(result.stage, equals(GameStage.roundStarted));
      expect(result.currentPlayerIndex, equals(0));
    });

    test('selects first alive player as current player', () {
      // Set first player as killed, second as alive
      final modifiedPlayers = List<Player>.from(testPlayers);
      modifiedPlayers[0] =
          modifiedPlayers[0].copyWith(lifeStatus: LifeStatus.killed);

      final state = baseState.copyWith(players: modifiedPlayers);
      final result = gameService.nextRound(state);

      expect(result.currentPlayerIndex, equals(1));
    });
  });

  group('GameService.startVoting', () {
    test('initializes voting with correct vote info', () {
      final result = gameService.startVoting(baseState);

      expect(result.stage, equals(GameStage.speaking));
      expect(result.voteInfo.votes, List.filled(5, 0));
      expect(result.voteInfo.voteStatus, equals(VoteStatus.running));
      expect(result.currentPlayerIndex, equals(0));

      // Only alive players can be selected
      expect(result.voteInfo.canBeSelected, [true, true, true, false, false]);
    });

    test('selects first eligible player for voting', () {
      // Modify players so first player is killed
      final modifiedPlayers = List<Player>.from(testPlayers);
      modifiedPlayers[0] =
          modifiedPlayers[0].copyWith(lifeStatus: LifeStatus.killed);
      modifiedPlayers[1] =
          modifiedPlayers[1].copyWith(lifeStatus: LifeStatus.killed);

      final state = baseState.copyWith(players: modifiedPlayers);
      final result = gameService.startVoting(state);

      expect(result.currentPlayerIndex, equals(2));
    });
  });
}
