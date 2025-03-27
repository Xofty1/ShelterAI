import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';

import '../models/player.dart';

abstract interface class GPTRepository{
  Future<Disaster> getDisaster(GameSettings settings);
  Future<List<Player>> getPlayers(GameSettings settings);
}