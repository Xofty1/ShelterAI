// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FirebaseRoom {
  int get playerId;
  bool get isHost;
  String get roomId;

  /// Create a copy of FirebaseRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FirebaseRoomCopyWith<FirebaseRoom> get copyWith =>
      _$FirebaseRoomCopyWithImpl<FirebaseRoom>(
          this as FirebaseRoom, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FirebaseRoom &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.isHost, isHost) || other.isHost == isHost) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playerId, isHost, roomId);

  @override
  String toString() {
    return 'FirebaseRoom(playerId: $playerId, isHost: $isHost, roomId: $roomId)';
  }
}

/// @nodoc
abstract mixin class $FirebaseRoomCopyWith<$Res> {
  factory $FirebaseRoomCopyWith(
          FirebaseRoom value, $Res Function(FirebaseRoom) _then) =
      _$FirebaseRoomCopyWithImpl;
  @useResult
  $Res call({int playerId, bool isHost, String roomId});
}

/// @nodoc
class _$FirebaseRoomCopyWithImpl<$Res> implements $FirebaseRoomCopyWith<$Res> {
  _$FirebaseRoomCopyWithImpl(this._self, this._then);

  final FirebaseRoom _self;
  final $Res Function(FirebaseRoom) _then;

  /// Create a copy of FirebaseRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? isHost = null,
    Object? roomId = null,
  }) {
    return _then(_self.copyWith(
      playerId: null == playerId
          ? _self.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      isHost: null == isHost
          ? _self.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _FirebaseRoom implements FirebaseRoom {
  const _FirebaseRoom(
      {required this.playerId, required this.isHost, required this.roomId});

  @override
  final int playerId;
  @override
  final bool isHost;
  @override
  final String roomId;

  /// Create a copy of FirebaseRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FirebaseRoomCopyWith<_FirebaseRoom> get copyWith =>
      __$FirebaseRoomCopyWithImpl<_FirebaseRoom>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirebaseRoom &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.isHost, isHost) || other.isHost == isHost) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playerId, isHost, roomId);

  @override
  String toString() {
    return 'FirebaseRoom(playerId: $playerId, isHost: $isHost, roomId: $roomId)';
  }
}

/// @nodoc
abstract mixin class _$FirebaseRoomCopyWith<$Res>
    implements $FirebaseRoomCopyWith<$Res> {
  factory _$FirebaseRoomCopyWith(
          _FirebaseRoom value, $Res Function(_FirebaseRoom) _then) =
      __$FirebaseRoomCopyWithImpl;
  @override
  @useResult
  $Res call({int playerId, bool isHost, String roomId});
}

/// @nodoc
class __$FirebaseRoomCopyWithImpl<$Res>
    implements _$FirebaseRoomCopyWith<$Res> {
  __$FirebaseRoomCopyWithImpl(this._self, this._then);

  final _FirebaseRoom _self;
  final $Res Function(_FirebaseRoom) _then;

  /// Create a copy of FirebaseRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playerId = null,
    Object? isHost = null,
    Object? roomId = null,
  }) {
    return _then(_FirebaseRoom(
      playerId: null == playerId
          ? _self.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      isHost: null == isHost
          ? _self.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
