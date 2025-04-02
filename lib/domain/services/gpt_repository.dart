import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';

import '../models/player.dart';

abstract interface class GPTRepository{
  // Future<Disaster> getDisaster(GameSettings settings);
  // Future<List<Player>> getPlayers(GameSettings settings);

  Future<Map<String, Object>> createGame(GameSettings settings);
abstract interface class GPTRepository {
  Future<Disaster> getDisaster(GameSettings settings);

  Future<List<Player>> getPlayers(GameSettings settings);

  Future<String> getFinale(GameSettings settings, Disaster disaster,
      List<Player> alivePlayers, List<Player> kickedPlayer);
}