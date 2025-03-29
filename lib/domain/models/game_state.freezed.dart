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
  GameSettings get settings;
  Disaster get disaster;
  GameStage get stage;
  int get iteration;
  List<Player> get players;
  List<List<String>> get notes;

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
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.iteration, iteration) ||
                other.iteration == iteration) &&
            const DeepCollectionEquality().equals(other.players, players) &&
            const DeepCollectionEquality().equals(other.notes, notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      settings,
      disaster,
      stage,
      iteration,
      const DeepCollectionEquality().hash(players),
      const DeepCollectionEquality().hash(notes));

  @override
  String toString() {
    return 'GameState(settings: $settings, disaster: $disaster, stage: $stage, iteration: $iteration, players: $players, notes: $notes)';
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
      GameStage stage,
      int iteration,
      List<Player> players,
      List<List<String>> notes});

  $GameSettingsCopyWith<$Res> get settings;
  $DisasterCopyWith<$Res> get disaster;
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
    Object? stage = null,
    Object? iteration = null,
    Object? players = null,
    Object? notes = null,
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
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as GameStage,
      iteration: null == iteration
          ? _self.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _self.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
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
}

/// @nodoc

class _GameState implements GameState {
  const _GameState(
      {required this.settings,
      required this.disaster,
      required this.stage,
      required this.iteration,
      required final List<Player> players,
      required final List<List<String>> notes})
      : _players = players,
        _notes = notes;

  @override
  final GameSettings settings;
  @override
  final Disaster disaster;
  @override
  final GameStage stage;
  @override
  final int iteration;
  final List<Player> _players;
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  final List<List<String>> _notes;
  @override
  List<List<String>> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

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
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.iteration, iteration) ||
                other.iteration == iteration) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      settings,
      disaster,
      stage,
      iteration,
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_notes));

  @override
  String toString() {
    return 'GameState(settings: $settings, disaster: $disaster, stage: $stage, iteration: $iteration, players: $players, notes: $notes)';
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
      GameStage stage,
      int iteration,
      List<Player> players,
      List<List<String>> notes});

  @override
  $GameSettingsCopyWith<$Res> get settings;
  @override
  $DisasterCopyWith<$Res> get disaster;
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
    Object? stage = null,
    Object? iteration = null,
    Object? players = null,
    Object? notes = null,
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
      stage: null == stage
          ? _self.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as GameStage,
      iteration: null == iteration
          ? _self.iteration
          : iteration // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _self._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      notes: null == notes
          ? _self._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
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
}

// dart format on
