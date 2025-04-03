import 'package:mocktail/mocktail.dart';
import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

// Mock classes
class MockGptRepository extends Mock implements GptRepository {}

// Fake classes for Mocktail registration
class FakeGameSettings extends Fake implements GameSettings {}
class FakeDisaster extends Fake implements Disaster {}
class FakePlayer extends Fake implements Player {}

// Test data factory methods
GameSettings createTestGameSettings() {
  return const GameSettings(
    playersCount: 5,
    difficulty: 2,
    plot: 'Test plot',
    safeMode: true,
    language: 'en',
    time: 30,
    isTimerEnable: true,
  );
}

Disaster createTestDisaster() {
  return const Disaster(
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
}

List<Player> createTestPlayers({int count = 5}) {
  return List.generate(count, (i) {
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
}

RunningGameState createBaseGameState() {
  return RunningGameState.initial(
    settings: createTestGameSettings(),
    disaster: createTestDisaster(),
    players: createTestPlayers(),
  );
}
