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

  test('nextRound initializes next round correctly', () {
    final result = gameService.nextRound(baseState);
    
    expect(result.roundInfo.roundNumber, equals(2));
    expect(result.stage, equals(GameStage.roundStarted));
  });
  
  test('startVoting initializes voting correctly', () {
    final result = gameService.startVoting(baseState);
    
    expect(result.stage, equals(GameStage.speaking));
    expect(result.voteInfo.votes, List.filled(5, 0));
    expect(result.voteInfo.voteStatus, equals(VoteStatus.running));
  });
}
