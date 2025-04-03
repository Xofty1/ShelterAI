import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';

import '../models/player.dart';

abstract interface class GptRepository {
  // Future<Disaster> getDisaster(GameSettings settings);
  // Future<List<Player>> getPlayers(GameSettings settings);

  Future<String> getFinale(GameSettings settings, Disaster disaster,
      List<Player> alivePlayers, List<Player> kickedPlayer);

  Future<Disaster> createGame(GameSettings settings);

  Future<List<Player>> createPlayers(GameSettings settings, Disaster disaster);

  // Future<Disaster> createStory(GameSettings settings);
}
