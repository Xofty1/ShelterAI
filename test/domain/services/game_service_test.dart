import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/bloc/game_bloc.dart';
import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
import 'package:shelter_ai/domain/services/game_service.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

class MockGptRepository extends Mock implements GptRepository {}

// Create fake classes for Mocktail registration
class FakeGameSettings extends Fake implements GameSettings {}
class FakeDisaster extends Fake implements Disaster {}
class FakePlayer extends Fake implements Player {}

void main() {
  late GameService gameService;
  late MockGptRepository mockRepository;
  late GameSettings testSettings;
  late Disaster testDisaster;
  late List<Player> testPlayers;
  late RunningGameState baseState;
  
  // Register fallback values before tests
  setUpAll(() {
    registerFallbackValue(FakeGameSettings());
    registerFallbackValue(FakeDisaster());
    registerFallbackValue(FakePlayer());
    registerFallbackValue(<Player>[]);
  });

  setUp(() {
    mockRepository = MockGptRepository();
    gameService = GameService(mockRepository);

    // Initialize test data
    testSettings = const GameSettings(
      playersCount: 5,
      difficulty: 2,
      plot: 'Test plot',
      safeMode: true,
      language: 'en',
      time: 30,
      isTimerEnable: true,
    );

    testDisaster = const Disaster(
      name: 'Test Disaster',
      disasterDescription: 'Test disaster description',
      disasterShortDescription: 'Test short description',
      shelterName: 'Test Shelter',
      location: 'Test Location',
      description: 'Test description',
      capacity: 5,
      rooms: ['Room 1', 'Room 2', 'Room 3'],
      resources: ['Resource 1', 'Resource 2', 'Resource 3'],
    );

    // Create 5 test players with different life statuses
    testPlayers = List.generate(5, (i) {
      return Player(
        id: i + 1,
        name: 'Player ${i + 1}',
        profession: 'Profession ${i + 1}',
        bio: 'Bio ${i + 1}',
        health: '100%',
        hobby: 'Hobby ${i + 1}',
        phobia: 'Phobia ${i + 1}',
        luggage: 'Luggage ${i + 1}',
        extra: 'Extra ${i + 1}',
        lifeStatus: i < 3 ? LifeStatus.alive : (i == 3 ? LifeStatus.last : LifeStatus.killed),
        knownProperties: List.generate(6, (_) => false),
        notes: [],
      );
    });

    // Create a base game state for tests
    baseState = RunningGameState.initial(
      settings: testSettings,
      disaster: testDisaster,
      players: testPlayers,
    );
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
      final finalRoundInfo = getRoundInfo(5, testSettings.playersCount);
      final finalRoundState = voteResultState.copyWith(roundInfo: finalRoundInfo);
      
      final result = gameService.getStateAfterVoteResult(finalRoundState);
      
      expect(result.stage, equals(GameStage.preFinalLoading));
    });

    test('moves to speaking stage if vote was not successful', () {
      final rerunningVoteInfo = voteResultState.voteInfo.copyWith(voteStatus: VoteStatus.reRunning);
      final rerunningState = voteResultState.copyWith(voteInfo: rerunningVoteInfo);
      
      final result = gameService.getStateAfterVoteResult(rerunningState);
      
      expect(result.stage, equals(GameStage.speaking));
    });
  });

  group('GameService.getFinalState', () {
    test('fetches finale from repository and updates state', () async {
      when(() => mockRepository.getFinale(any(), any(), any(), any()))
          .thenAnswer((_) async => 'Test finale text');
      
      final preFinalState = baseState.copyWith(stage: GameStage.preFinalLoading);
      final result = await gameService.getFinalState(preFinalState);
      
      expect(result.stage, equals(GameStage.finals));
      expect((result as RunningGameState).finals, equals('Test finale text'));
      verify(() => mockRepository.getFinale(any(), any(), any(), any())).called(1);
    });

    test('handles errors from repository', () async {
      when(() => mockRepository.getFinale(any(), any(), any(), any()))
          .thenThrow(Exception('Test error'));
      
      final preFinalState = baseState.copyWith(stage: GameStage.preFinalLoading);
      final result = await gameService.getFinalState(preFinalState);
      
      expect(result.stage, equals(GameStage.finals));
      expect((result as RunningGameState).finals, 
          contains('Сам бог не ведает судьбу человечества'));
      verify(() => mockRepository.getFinale(any(), any(), any(), any())).called(1);
    });
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
          expect(result.players[i].knownProperties, 
              everyElement(isFalse));
        }
      }
    });
  });

  group('GameService.nextAlive', () {
    test('finds next alive player', () {
      final index = gameService.nextAlive(testPlayers, 0);
      expect(index, equals(0)); // First player is alive
      
      final nextIndex = gameService.nextAlive(testPlayers, 1);
      expect(nextIndex, equals(1)); // Second player is alive
      
      final lastAliveIndex = gameService.nextAlive(testPlayers, 3);
      expect(lastAliveIndex, equals(-1)); // No alive players from index 3 onwards
    });

    test('returns -1 when no alive players found', () {
      final allDeadPlayers = testPlayers.map(
        (p) => p.copyWith(lifeStatus: LifeStatus.killed)
      ).toList();
      
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
      final allKilledPlayers = testPlayers.map(
        (p) => p.copyWith(lifeStatus: LifeStatus.killed)
      ).toList();
      
      final index = gameService.nextVoting(allKilledPlayers, 0);
      expect(index, equals(-1));
    });
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
      modifiedPlayers[0] = modifiedPlayers[0].copyWith(lifeStatus: LifeStatus.killed);
      
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
      modifiedPlayers[0] = modifiedPlayers[0].copyWith(lifeStatus: LifeStatus.killed);
      modifiedPlayers[1] = modifiedPlayers[1].copyWith(lifeStatus: LifeStatus.killed);
      
      final state = baseState.copyWith(players: modifiedPlayers);
      final result = gameService.startVoting(state);
      
      expect(result.currentPlayerIndex, equals(2));
    });
  });

  group('GameService.updateVotes', () {
    test('increases vote count for selected player', () {
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
  });

  group('GameService.isVoteSuccess', () {
    test('returns true when vote has clear winner', () {
      final voteInfo = VoteInfo(
        votes: [3, 1, 1, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );
      
      final state = baseState.copyWith(
        voteInfo: voteInfo,
        roundInfo: getRoundInfo(2, 5), // 1 player to kick
      );
      
      expect(gameService.isVoteSuccess(state), isTrue);
    });

    test('returns false when vote is tied', () {
      final voteInfo = VoteInfo(
        votes: [2, 2, 1, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );
      
      final state = baseState.copyWith(
        voteInfo: voteInfo,
        roundInfo: getRoundInfo(2, 5), // 1 player to kick
      );
      
      expect(gameService.isVoteSuccess(state), isFalse);
    });
  });

  group('GameService.finishVote', () {
    test('updates player statuses and selects kicked players correctly', () {
      final voteInfo = VoteInfo(
        votes: [3, 1, 1, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );
      
      // Player 3 (index 2) is in "last" status
      final modifiedPlayers = List<Player>.from(testPlayers);
      modifiedPlayers[2] = modifiedPlayers[2].copyWith(lifeStatus: LifeStatus.last);
      
      final state = baseState.copyWith(
        players: modifiedPlayers,
        voteInfo: voteInfo,
        roundInfo: getRoundInfo(2, 5), // 1 player to kick
      );
      
      final result = gameService.finishVote(state);
      
      // Check player statuses
      expect(result.players[0].lifeStatus, equals(LifeStatus.last)); // Most votes, becomes "last"
      expect(result.players[2].lifeStatus, equals(LifeStatus.killed)); // Was "last", becomes "killed"
      expect(result.voteInfo.selectedIndexes, equals([0])); // Player 1 was selected
      expect(result.voteInfo.voteStatus, equals(VoteStatus.successful));
      
      // Check that all properties of kicked player are revealed
      expect(result.players[0].knownProperties, everyElement(isTrue));
    });
  });

  group('GameService.reVote', () {
    test('resets voting process for tied players', () {
      final voteInfo = VoteInfo(
        votes: [2, 2, 1, 0, 0],
        canBeSelected: List.filled(5, true),
        selectedIndexes: [],
        voteStatus: VoteStatus.running,
      );
      
      final state = baseState.copyWith(voteInfo: voteInfo);
      
      final result = gameService.reVote(state);
      
      expect(result.stage, equals(GameStage.voteResult));
      expect(result.voteInfo.voteStatus, equals(VoteStatus.reRunning));
      expect(result.voteInfo.votes, List.filled(5, 0)); // Votes reset
      
      // Only players with 2 or more votes can be selected
      expect(result.voteInfo.canBeSelected, equals([true, true, false, false, false]));
      expect(result.voteInfo.selectedIndexes, isEmpty);
    });
  });
}
