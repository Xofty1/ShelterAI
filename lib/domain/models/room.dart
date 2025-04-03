import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';

import '../bloc/game_bloc.dart';
part 'room.freezed.dart';
part 'room.g.dart';

@freezed
abstract class Room with _$Room {
  const factory Room({
    required GameSettings gameSettings,
    required List<Player> players,
    required String password,
    required int currentPlayerIndex,
    required VoteInfo voteInfo,
    required RoundInfo roundInfo,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
