// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Room {
  RunningGameState get gameState;
  String get password;
  int get currentPlayerIndex;
  int get currentPlayerCounter;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoomCopyWith<Room> get copyWith =>
      _$RoomCopyWithImpl<Room>(this as Room, _$identity);

  /// Serializes this Room to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Room &&
            (identical(other.gameState, gameState) ||
                other.gameState == gameState) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                other.currentPlayerIndex == currentPlayerIndex) &&
            (identical(other.currentPlayerCounter, currentPlayerCounter) ||
                other.currentPlayerCounter == currentPlayerCounter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gameState, password,
      currentPlayerIndex, currentPlayerCounter);

  @override
  String toString() {
    return 'Room(gameState: $gameState, password: $password, currentPlayerIndex: $currentPlayerIndex, currentPlayerCounter: $currentPlayerCounter)';
  }
}

/// @nodoc
abstract mixin class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) _then) =
      _$RoomCopyWithImpl;
  @useResult
  $Res call(
      {RunningGameState gameState,
      String password,
      int currentPlayerIndex,
      int currentPlayerCounter});

  $RunningGameStateCopyWith<$Res> get gameState;
}

/// @nodoc
class _$RoomCopyWithImpl<$Res> implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._self, this._then);

  final Room _self;
  final $Res Function(Room) _then;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameState = null,
    Object? password = null,
    Object? currentPlayerIndex = null,
    Object? currentPlayerCounter = null,
  }) {
    return _then(_self.copyWith(
      gameState: null == gameState
          ? _self.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as RunningGameState,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      currentPlayerIndex: null == currentPlayerIndex
          ? _self.currentPlayerIndex
          : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentPlayerCounter: null == currentPlayerCounter
          ? _self.currentPlayerCounter
          : currentPlayerCounter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RunningGameStateCopyWith<$Res> get gameState {
    return $RunningGameStateCopyWith<$Res>(_self.gameState, (value) {
      return _then(_self.copyWith(gameState: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Room implements Room {
  const _Room(
      {required this.gameState,
      required this.password,
      required this.currentPlayerIndex,
      required this.currentPlayerCounter});
  factory _Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  @override
  final RunningGameState gameState;
  @override
  final String password;
  @override
  final int currentPlayerIndex;
  @override
  final int currentPlayerCounter;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoomCopyWith<_Room> get copyWith =>
      __$RoomCopyWithImpl<_Room>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RoomToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Room &&
            (identical(other.gameState, gameState) ||
                other.gameState == gameState) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                other.currentPlayerIndex == currentPlayerIndex) &&
            (identical(other.currentPlayerCounter, currentPlayerCounter) ||
                other.currentPlayerCounter == currentPlayerCounter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gameState, password,
      currentPlayerIndex, currentPlayerCounter);

  @override
  String toString() {
    return 'Room(gameState: $gameState, password: $password, currentPlayerIndex: $currentPlayerIndex, currentPlayerCounter: $currentPlayerCounter)';
  }
}

/// @nodoc
abstract mixin class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) _then) =
      __$RoomCopyWithImpl;
  @override
  @useResult
  $Res call(
      {RunningGameState gameState,
      String password,
      int currentPlayerIndex,
      int currentPlayerCounter});

  @override
  $RunningGameStateCopyWith<$Res> get gameState;
}

/// @nodoc
class __$RoomCopyWithImpl<$Res> implements _$RoomCopyWith<$Res> {
  __$RoomCopyWithImpl(this._self, this._then);

  final _Room _self;
  final $Res Function(_Room) _then;

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gameState = null,
    Object? password = null,
    Object? currentPlayerIndex = null,
    Object? currentPlayerCounter = null,
  }) {
    return _then(_Room(
      gameState: null == gameState
          ? _self.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as RunningGameState,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      currentPlayerIndex: null == currentPlayerIndex
          ? _self.currentPlayerIndex
          : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentPlayerCounter: null == currentPlayerCounter
          ? _self.currentPlayerCounter
          : currentPlayerCounter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RunningGameStateCopyWith<$Res> get gameState {
    return $RunningGameStateCopyWith<$Res>(_self.gameState, (value) {
      return _then(_self.copyWith(gameState: value));
    });
  }
}

// dart format on
