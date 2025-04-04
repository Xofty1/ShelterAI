import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';

import '../models/player.dart';

abstract interface class GptRepository {
  Future<String> getFinale(GameSettings settings, Disaster disaster,
      List<Player> alivePlayers, List<Player> kickedPlayer);

  Future<Disaster> createDisaster(GameSettings settings);

  Future<List<Player>> createPlayers(GameSettings settings, Disaster disaster);
}
