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
  GameSettings get gameSettings;
  List<Player> get players;
  String get password;
  int get currentPlayerIndex;
  VoteInfo get voteInfo;
  RoundInfo get roundInfo;

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
            (identical(other.gameSettings, gameSettings) ||
                other.gameSettings == gameSettings) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                other.currentPlayerIndex == currentPlayerIndex) &&
            (identical(other.voteInfo, voteInfo) ||
                other.voteInfo == voteInfo) &&
            (identical(other.roundInfo, roundInfo) ||
                other.roundInfo == roundInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameSettings,
      const DeepCollectionEquality().hash(players),
      password,
      currentPlayerIndex,
      voteInfo,
      roundInfo);

  @override
  String toString() {
    return 'Room(gameSettings: $gameSettings, players: $players, password: $password, currentPlayerIndex: $currentPlayerIndex, voteInfo: $voteInfo, roundInfo: $roundInfo)';
  }
}

/// @nodoc
abstract mixin class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) _then) =
      _$RoomCopyWithImpl;
  @useResult
  $Res call(
      {GameSettings gameSettings,
      List<Player> players,
      String password,
      int currentPlayerIndex,
      VoteInfo voteInfo,
      RoundInfo roundInfo});

  $GameSettingsCopyWith<$Res> get gameSettings;
  $VoteInfoCopyWith<$Res> get voteInfo;
  $RoundInfoCopyWith<$Res> get roundInfo;
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
    Object? gameSettings = null,
    Object? players = null,
    Object? password = null,
    Object? currentPlayerIndex = null,
    Object? voteInfo = null,
    Object? roundInfo = null,
  }) {
    return _then(_self.copyWith(
      gameSettings: null == gameSettings
          ? _self.gameSettings
          : gameSettings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
      players: null == players
          ? _self.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      currentPlayerIndex: null == currentPlayerIndex
          ? _self.currentPlayerIndex
          : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      voteInfo: null == voteInfo
          ? _self.voteInfo
          : voteInfo // ignore: cast_nullable_to_non_nullable
              as VoteInfo,
      roundInfo: null == roundInfo
          ? _self.roundInfo
          : roundInfo // ignore: cast_nullable_to_non_nullable
              as RoundInfo,
    ));
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameSettingsCopyWith<$Res> get gameSettings {
    return $GameSettingsCopyWith<$Res>(_self.gameSettings, (value) {
      return _then(_self.copyWith(gameSettings: value));
    });
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoteInfoCopyWith<$Res> get voteInfo {
    return $VoteInfoCopyWith<$Res>(_self.voteInfo, (value) {
      return _then(_self.copyWith(voteInfo: value));
    });
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoundInfoCopyWith<$Res> get roundInfo {
    return $RoundInfoCopyWith<$Res>(_self.roundInfo, (value) {
      return _then(_self.copyWith(roundInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Room implements Room {
  const _Room(
      {required this.gameSettings,
      required final List<Player> players,
      required this.password,
      required this.currentPlayerIndex,
      required this.voteInfo,
      required this.roundInfo})
      : _players = players;
  factory _Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  @override
  final GameSettings gameSettings;
  final List<Player> _players;
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final String password;
  @override
  final int currentPlayerIndex;
  @override
  final VoteInfo voteInfo;
  @override
  final RoundInfo roundInfo;

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
            (identical(other.gameSettings, gameSettings) ||
                other.gameSettings == gameSettings) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                other.currentPlayerIndex == currentPlayerIndex) &&
            (identical(other.voteInfo, voteInfo) ||
                other.voteInfo == voteInfo) &&
            (identical(other.roundInfo, roundInfo) ||
                other.roundInfo == roundInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameSettings,
      const DeepCollectionEquality().hash(_players),
      password,
      currentPlayerIndex,
      voteInfo,
      roundInfo);

  @override
  String toString() {
    return 'Room(gameSettings: $gameSettings, players: $players, password: $password, currentPlayerIndex: $currentPlayerIndex, voteInfo: $voteInfo, roundInfo: $roundInfo)';
  }
}

/// @nodoc
abstract mixin class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) _then) =
      __$RoomCopyWithImpl;
  @override
  @useResult
  $Res call(
      {GameSettings gameSettings,
      List<Player> players,
      String password,
      int currentPlayerIndex,
      VoteInfo voteInfo,
      RoundInfo roundInfo});

  @override
  $GameSettingsCopyWith<$Res> get gameSettings;
  @override
  $VoteInfoCopyWith<$Res> get voteInfo;
  @override
  $RoundInfoCopyWith<$Res> get roundInfo;
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
    Object? gameSettings = null,
    Object? players = null,
    Object? password = null,
    Object? currentPlayerIndex = null,
    Object? voteInfo = null,
    Object? roundInfo = null,
  }) {
    return _then(_Room(
      gameSettings: null == gameSettings
          ? _self.gameSettings
          : gameSettings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
      players: null == players
          ? _self._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      currentPlayerIndex: null == currentPlayerIndex
          ? _self.currentPlayerIndex
          : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      voteInfo: null == voteInfo
          ? _self.voteInfo
          : voteInfo // ignore: cast_nullable_to_non_nullable
              as VoteInfo,
      roundInfo: null == roundInfo
          ? _self.roundInfo
          : roundInfo // ignore: cast_nullable_to_non_nullable
              as RoundInfo,
    ));
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameSettingsCopyWith<$Res> get gameSettings {
    return $GameSettingsCopyWith<$Res>(_self.gameSettings, (value) {
      return _then(_self.copyWith(gameSettings: value));
    });
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoteInfoCopyWith<$Res> get voteInfo {
    return $VoteInfoCopyWith<$Res>(_self.voteInfo, (value) {
      return _then(_self.copyWith(voteInfo: value));
    });
  }

  /// Create a copy of Room
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoundInfoCopyWith<$Res> get roundInfo {
    return $RoundInfoCopyWith<$Res>(_self.roundInfo, (value) {
      return _then(_self.copyWith(roundInfo: value));
    });
  }
}

// dart format on
