import 'package:freezed_annotation/freezed_annotation.dart';
part 'firebase_room.freezed.dart';

@freezed
abstract class FirebaseRoom with _$FirebaseRoom {
  const factory FirebaseRoom({
    required int playerId,
    required bool isHost,
    required String roomId,
  }) = _FirebaseRoom;
}