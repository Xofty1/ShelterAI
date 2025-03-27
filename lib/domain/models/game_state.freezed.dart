// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameState {
// Настройки игры
  GameSettings get settings; // Свойства катастрофы
  Disaster get disaster; // Список игроков
  List<Player> get players; // Текущая стадия игры
  GameStage get stage; // Вся информация по текущему раунду
  RoundInfo
      get roundInfo; // Количество действий, сделынных игроком на данном ходу (кол-во открытых карточек)
  int get actionsTaken; // Индекс текущего игрока (чей ход)
  int get currentPlayerIndex;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameStateCopyWith<GameState> get copyWith =>
      _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameState &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.disaster, disaster) ||
                other.disaster == disaster) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.roundInfo, roundInfo) ||
                other.roundInfo == roundInfo) &&
            (identical(other.actionsTaken, actionsTaken) ||
                other.actionsTaken == actionsTaken) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                other.currentPlayerIndex == currentPlayerIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      settings,
      disaster,
      const DeepCollectionEquality().hash(players),
      stage,
      roundInfo,
      actionsTaken,
      currentPlayerIndex);

  @override
  String toString() {
    return 'GameState(settings: $settings, disaster: $disaster, players: $players, stage: $stage, roundInfo: $roundInfo, actionsTaken: $actionsTaken, currentPlayerIndex: $currentPlayerIndex)';
  }
}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) =
      _$GameStateCopyWithImpl;
  @useResult
  $Res call(
      {GameSettings settings,
      Disaster disaster,
      List<Player> players,
      GameStage stage,
      RoundInfo roundInfo,
      int actionsTaken,
      int currentPlayerIndex});

  $GameSettingsCopyWith<$Res> get settings;
  $DisasterCopyWith<$Res> get disaster;
  $RoundInfoCopyWith<$Res> get roundInfo;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
    Object? disaster = null,
    Object? players = null,
    Object? stage = null,
    Object? roundInfo = null,
    Object? actionsTaken = null,
    Object? currentPlayerIndex = null,
  }) {
    return _then(_self.copyWith(
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
      disaster: null == disaster
          ? _self.disaster
          : disaster // ignore: cast_nullable_to_non_nullable
              as Disaster,
      players: null == players
          ? _self.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as GameStage,
      roundInfo: null == roundInfo
          ? _self.roundInfo
          : roundInfo // ignore: cast_nullable_to_non_nullable
              as RoundInfo,
      actionsTaken: null == actionsTaken
          ? _self.actionsTaken
          : actionsTaken // ignore: cast_nullable_to_non_nullable
              as int,
      currentPlayerIndex: null == currentPlayerIndex
          ? _self.currentPlayerIndex
          : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameSettingsCopyWith<$Res> get settings {
    return $GameSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisasterCopyWith<$Res> get disaster {
    return $DisasterCopyWith<$Res>(_self.disaster, (value) {
      return _then(_self.copyWith(disaster: value));
    });
  }

  /// Create a copy of GameState
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

class _GameState implements GameState {
  const _GameState(
      {required this.settings,
      required this.disaster,
      required final List<Player> players,
      required this.stage,
      required this.roundInfo,
      required this.actionsTaken,
      required this.currentPlayerIndex})
      : _players = players;

// Настройки игры
  @override
  final GameSettings settings;
// Свойства катастрофы
  @override
  final Disaster disaster;
// Список игроков
  final List<Player> _players;
// Список игроков
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

// Текущая стадия игры
  @override
  final GameStage stage;
// Вся информация по текущему раунду
  @override
  final RoundInfo roundInfo;
// Количество действий, сделынных игроком на данном ходу (кол-во открытых карточек)
  @override
  final int actionsTaken;
// Индекс текущего игрока (чей ход)
  @override
  final int currentPlayerIndex;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameState &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.disaster, disaster) ||
                other.disaster == disaster) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.roundInfo, roundInfo) ||
                other.roundInfo == roundInfo) &&
            (identical(other.actionsTaken, actionsTaken) ||
                other.actionsTaken == actionsTaken) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                other.currentPlayerIndex == currentPlayerIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      settings,
      disaster,
      const DeepCollectionEquality().hash(_players),
      stage,
      roundInfo,
      actionsTaken,
      currentPlayerIndex);

  @override
  String toString() {
    return 'GameState(settings: $settings, disaster: $disaster, players: $players, stage: $stage, roundInfo: $roundInfo, actionsTaken: $actionsTaken, currentPlayerIndex: $currentPlayerIndex)';
  }
}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(
          _GameState value, $Res Function(_GameState) _then) =
      __$GameStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {GameSettings settings,
      Disaster disaster,
      List<Player> players,
      GameStage stage,
      RoundInfo roundInfo,
      int actionsTaken,
      int currentPlayerIndex});

  @override
  $GameSettingsCopyWith<$Res> get settings;
  @override
  $DisasterCopyWith<$Res> get disaster;
  @override
  $RoundInfoCopyWith<$Res> get roundInfo;
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? settings = null,
    Object? disaster = null,
    Object? players = null,
    Object? stage = null,
    Object? roundInfo = null,
    Object? actionsTaken = null,
    Object? currentPlayerIndex = null,
  }) {
    return _then(_GameState(
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
      disaster: null == disaster
          ? _self.disaster
          : disaster // ignore: cast_nullable_to_non_nullable
              as Disaster,
      players: null == players
          ? _self._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as GameStage,
      roundInfo: null == roundInfo
          ? _self.roundInfo
          : roundInfo // ignore: cast_nullable_to_non_nullable
              as RoundInfo,
      actionsTaken: null == actionsTaken
          ? _self.actionsTaken
          : actionsTaken // ignore: cast_nullable_to_non_nullable
              as int,
      currentPlayerIndex: null == currentPlayerIndex
          ? _self.currentPlayerIndex
          : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameSettingsCopyWith<$Res> get settings {
    return $GameSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisasterCopyWith<$Res> get disaster {
    return $DisasterCopyWith<$Res>(_self.disaster, (value) {
      return _then(_self.copyWith(disaster: value));
    });
  }

  /// Create a copy of GameState
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
