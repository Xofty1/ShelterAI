import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/bloc/game_bloc.dart';
import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

class MockGptRepository extends Mock implements GPTRepository {}

void main() async {
  late GameBloc gameBloc;
  late MockGptRepository mockRepository;
  late Disaster testDisaster;
  late List<Player> testPlayers;
  late GameSettings testSettings;

  setUp(() {
    mockRepository = MockGptRepository();
    testDisaster = const Disaster(
      name: "Test Disaster",
      disasterDescription: "Test disaster description",
      disasterShortDescription: "Test short description",
      shelterName: "Test Shelter",
      location: "Test Location",
      description: "Test detailed description",
      capacity: 5,
      rooms: ["Room 1", "Room 2"],
      resources: ["Resource 1", "Resource 2"],
    );
    
    testPlayers = List.generate(
      5,
      (i) => Player(
        name: "Player ${i + 1}",
        profession: "Profession ${i + 1}",
        bio: "Bio ${i + 1}",
        health: "100%",
        hobby: "Hobby ${i + 1}",
        phobia: "Phobia ${i + 1}",
        luggage: "Luggage ${i + 1}",
        extra: "Extra ${i + 1}",
        lifeStatus: LifeStatus.alive,
        knownProperties: List.generate(6, (_) => false),
        notes: [],
      ),
    );
    
    testSettings = const GameSettings(
      playersCount: 5,
      difficulty: 2,
      plot: "Test Plot",
      safeMode: true,
      time: 30,
      isTimerEnable: true,
    );
    
    // Mock getFinale response for tests that reach the finals
    when(() => mockRepository.getFinale(
      any(), any(), any(), any()
    )).thenAnswer((_) async => "Test finale");
    
    gameBloc = GameBloc(
      repository: mockRepository,
      disaster: testDisaster,
      players: testPlayers,
      settings: testSettings,
    );
  });

  tearDown(() {
    gameBloc.close();
  });

  test('Initial state should be intro', () {
    final state = gameBloc.state as RunningGameState;
    expect(state.stage, equals(GameStage.intro));
  });

//   group('ReadyGameEvent transitions', () {
//     test('From intro stage to roundStarted stage', () async {
//       // Act
//       gameBloc.add(ReadyGameEvent());
      
//       // Wait for state changes
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>().having(
//           (state) => state.stage,
//           'stage',
//           equals(GameStage.roundStarted),
//         )),
//       );
//     });

//     test('From roundStarted stage to openCards stage', () async {
//       // Arrange - first move from intro to roundStarted
//       gameBloc.add(ReadyGameEvent());
//       await pumpEventQueue();
      
//       // Act - move from roundStarted to openCards
//       gameBloc.add(ReadyGameEvent());
      
//       // Assert
//       await expectLater(
//         gameBloc.stream, 
//         emits(isA<RunningGameState>().having(
//           (state) => state.stage,
//           'stage',
//           equals(GameStage.openCards),
//         )),
//       );
//     });

//     test('From speaking stage to voting stage', () async {
//       // Arrange - setup the game to be in speaking stage
//       final speakingState = RunningGameState.initial(
//         settings: testSettings, 
//         disaster: testDisaster, 
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.speaking,
//         voteInfo: VoteInfo(
//           votes: List.filled(testSettings.playersCount, 0),
//           canBeSelected: List.filled(testSettings.playersCount, true),
//           selectedIndexes: [],
//           voteStatus: VoteStatus.running,
//         ),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(speakingState);
      
//       // Act
//       gameBloc.add(ReadyGameEvent());
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>().having(
//           (state) => state.stage,
//           'stage',
//           equals(GameStage.voting),
//         )),
//       );
//     });
    
//     test('From voteResult with successful vote to next round', () async {
//       // Arrange - setup game in voteResult stage with successful vote
//       final voteResultState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.voteResult,
//         voteInfo: const VoteInfo(
//           votes: [2, 1, 1, 0, 0],
//           canBeSelected: [true, true, true, true, true],
//           selectedIndexes: [0],
//           voteStatus: VoteStatus.successful,
//         ),
//         roundInfo: getRoundInfo(2, testSettings.playersCount),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(voteResultState);
      
//       // Act
//       gameBloc.add(ReadyGameEvent());
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>()
//           .having((state) => state.stage, 'stage', equals(GameStage.roundStarted))
//           .having((state) => state.voteInfo.voteStatus, 'voteStatus', equals(VoteStatus.none))
//         ),
//       );
//     });
    
//     test('From voteResult with non-successful vote to speaking stage', () async {
//       // Arrange - setup game in voteResult stage with non-successful vote
//       final voteResultState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.voteResult,
//         voteInfo: const VoteInfo(
//           votes: [1, 1, 1, 1, 0],
//           canBeSelected: [true, true, true, true, true],
//           selectedIndexes: [],
//           voteStatus: VoteStatus.reRunning,
//         ),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(voteResultState);
      
//       // Act
//       gameBloc.add(ReadyGameEvent());
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>().having(
//           (state) => state.stage,
//           'stage',
//           equals(GameStage.speaking),
//         )),
//       );
//     });
    
//     test('From voteResult with successful vote in final round transitions to preFinalLoading and then to finals', () async {
//       // Arrange - setup game in voteResult stage in round 6 with successful vote
//       final finalRoundState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.voteResult,
//         roundInfo: getRoundInfo(6, testSettings.playersCount),
//         voteInfo: const VoteInfo(
//           votes: [2, 1, 1, 0, 0],
//           canBeSelected: [true, true, true, true, true],
//           selectedIndexes: [0],
//           voteStatus: VoteStatus.successful,
//         ),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(finalRoundState);
      
//       // Act
//       gameBloc.add(ReadyGameEvent());
      
//       // Assert - we expect to first go to preFinalLoading 
//       // and then automatically to finals
//       await expectLater(
//         gameBloc.stream,
//         emitsInOrder([
//           isA<RunningGameState>().having(
//             (state) => state.stage, 
//             'stage', 
//             equals(GameStage.preFinalLoading)
//           ),
//           isA<RunningGameState>()
//             .having((state) => state.stage, 'stage', equals(GameStage.finals))
//             .having((state) => state.finals, 'finals', equals("Test finale")),
//         ]),
//       );
      
//       // Verify getFinale was called
//       verify(() => mockRepository.getFinale(any(), any(), any(), any())).called(1);
//     });
//   });

//   group('OpenedPropertyGameEvent', () {
//     test('Updates player properties and moves to next player if available', () async {
//       // Arrange - set game to openCards stage
//       final openCardsState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.openCards,
//         currentPlayerIndex: 0,
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(openCardsState);
      
//       // Act - open property for first player and move to second
//       gameBloc.add(OpenedPropertyGameEvent([0, 1]));
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>()
//           .having((state) => state.currentPlayerIndex, 'currentPlayerIndex', equals(1))
//           .having((state) => state.players[0].knownProperties[0], 'first property known', isTrue)
//           .having((state) => state.players[0].knownProperties[1], 'second property known', isTrue)
//         ),
//       );
//     });
    
//     test('When all players opened properties and kickedCount is 0, moves to next round', () async {
//       // Arrange - set game to openCards stage with last player's turn
//       final lastPlayerState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.openCards,
//         currentPlayerIndex: 4,  // Last player
//         roundInfo: getRoundInfo(1, testSettings.playersCount).copyWith(
//           kickedCount: 0  // No players to kick
//         ),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(lastPlayerState);
      
//       // Act
//       gameBloc.add(OpenedPropertyGameEvent([0, 1]));
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>()
//           .having((state) => state.stage, 'stage', equals(GameStage.roundStarted))
//           .having((state) => state.roundInfo.roundNumber, 'roundNumber', equals(1))  // Still round 1
//         ),
//       );
//     });
    
//     test('When all players opened properties and kickedCount > 0, moves to speaking stage', () async {
//       // Arrange - set game to openCards stage with last player's turn
//       final lastPlayerState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.openCards,
//         currentPlayerIndex: 4,  // Last player
//         roundInfo: getRoundInfo(1, testSettings.playersCount).copyWith(
//           kickedCount: 1  // One player to kick
//         ),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(lastPlayerState);
      
//       // Act
//       gameBloc.add(OpenedPropertyGameEvent([0, 1]));
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>()
//           .having((state) => state.stage, 'stage', equals(GameStage.speaking))
//           .having((state) => state.voteInfo.voteStatus, 'voteStatus', equals(VoteStatus.running))
//         ),
//       );
//     });
//   });

//   group('VotedGameEvent', () {
//     test('Records vote and moves to next voter if available', () async {
//       // Arrange - set game to voting stage
//       final votingState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.voting,
//         currentPlayerIndex: 0,
//         voteInfo: VoteInfo(
//           votes: List.filled(testSettings.playersCount, 0),
//           canBeSelected: List.filled(testSettings.playersCount, true),
//           selectedIndexes: [],
//           voteStatus: VoteStatus.running,
//         ),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(votingState);
      
//       // Act - player 0 votes for player 2
//       gameBloc.add(VotedGameEvent(2));
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>()
//           .having((state) => state.currentPlayerIndex, 'currentPlayerIndex', equals(1))
//           .having((state) => state.voteInfo.votes[2], 'votes for player 2', equals(1))
//         ),
//       );
//     });
    
//     test('When all votes cast with clear winner, transitions to voteResult with successful status', () async {
//       // Arrange - set game to voting stage with last player voting
//       final lastVoterState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.voting,
//         currentPlayerIndex: 4,  // Last player
//         roundInfo: getRoundInfo(1, testSettings.playersCount).copyWith(
//           kickedCount: 1  // One player to kick
//         ),
//         voteInfo: VoteInfo(
//           votes: [0, 3, 0, 0, 0],  // Player 1 has 3 votes already
//           canBeSelected: List.filled(testSettings.playersCount, true),
//           selectedIndexes: [],
//           voteStatus: VoteStatus.running,
//         ),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(lastVoterState);
      
//       // Act - last player votes for player 1 too
//       gameBloc.add(VotedGameEvent(1));
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>()
//           .having((state) => state.stage, 'stage', equals(GameStage.voteResult))
//           .having((state) => state.voteInfo.voteStatus, 'voteStatus', equals(VoteStatus.successful))
//           .having((state) => state.voteInfo.selectedIndexes, 'selectedIndexes', equals([1]))
//           .having((state) => state.roundInfo.roundNumber, 'roundNumber', equals(2))  // Round incremented
//         ),
//       );
//     });
    
//     test('When all votes cast with tie, transitions to voteResult with reRunning status', () async {
//       // Arrange - set game to voting stage with last player voting
//       final lastVoterState = RunningGameState.initial(
//         settings: testSettings,
//         disaster: testDisaster,
//         players: testPlayers,
//       ).copyWith(
//         stage: GameStage.voting,
//         currentPlayerIndex: 4,  // Last player
//         roundInfo: getRoundInfo(1, testSettings.playersCount).copyWith(
//           kickedCount: 1  // One player to kick
//         ),
//         voteInfo: VoteInfo(
//           votes: [1, 1, 1, 1, 0],  // Tie between players 0-3
//           canBeSelected: List.filled(testSettings.playersCount, true),
//           selectedIndexes: [],
//           voteStatus: VoteStatus.running,
//         ),
//       );
      
//       gameBloc = GameBloc(
//         repository: mockRepository,
//         disaster: testDisaster,
//         players: testPlayers,
//         settings: testSettings,
//       );
      
//       // Use a trick to set the state
//       (gameBloc as dynamic).emit(lastVoterState);
      
//       // Act - last player votes for player 0
//       gameBloc.add(VotedGameEvent(0));
      
//       // Assert
//       await expectLater(
//         gameBloc.stream,
//         emits(isA<RunningGameState>()
//           .having((state) => state.stage, 'stage', equals(GameStage.voteResult))
//           .having((state) => state.voteInfo.voteStatus, 'voteStatus', equals(VoteStatus.reRunning))
//           .having((state) => state.roundInfo.roundNumber, 'roundNumber', equals(1))  // Round not incremented
//         ),
//       );
//     });
//   });
}