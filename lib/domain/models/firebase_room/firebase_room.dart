import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';

import '../../../domain/bloc/game_bloc.dart';
part 'firebase_room.freezed.dart';

@freezed
abstract class FirebaseRoom with _$FirebaseRoom {
  const factory FirebaseRoom({
    required int playerId,
    required bool isHost,
    required String roomId,
  }) = _FirebaseRoom;

}
