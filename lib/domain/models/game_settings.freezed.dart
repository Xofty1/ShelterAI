// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameSettings {
  int get playersCount;
  int get difficulty;
  String get plot;
  bool get safeMode;
  String get language;
  int get time;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameSettingsCopyWith<GameSettings> get copyWith =>
      _$GameSettingsCopyWithImpl<GameSettings>(
          this as GameSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameSettings &&
            (identical(other.playersCount, playersCount) ||
                other.playersCount == playersCount) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.plot, plot) || other.plot == plot) &&
            (identical(other.safeMode, safeMode) ||
                other.safeMode == safeMode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, playersCount, difficulty, plot, safeMode, language, time);

  @override
  String toString() {
    return 'GameSettings(playersCount: $playersCount, difficulty: $difficulty, plot: $plot, safeMode: $safeMode, language: $language, time: $time)';
  }
}

/// @nodoc
abstract mixin class $GameSettingsCopyWith<$Res> {
  factory $GameSettingsCopyWith(
          GameSettings value, $Res Function(GameSettings) _then) =
      _$GameSettingsCopyWithImpl;
  @useResult
  $Res call(
      {int playersCount,
      int difficulty,
      String plot,
      bool safeMode,
      String language,
      int time});
}

/// @nodoc
class _$GameSettingsCopyWithImpl<$Res> implements $GameSettingsCopyWith<$Res> {
  _$GameSettingsCopyWithImpl(this._self, this._then);

  final GameSettings _self;
  final $Res Function(GameSettings) _then;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playersCount = null,
    Object? difficulty = null,
    Object? plot = null,
    Object? safeMode = null,
    Object? language = null,
    Object? time = null,
  }) {
    return _then(_self.copyWith(
      playersCount: null == playersCount
          ? _self.playersCount
          : playersCount // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _self.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      plot: null == plot
          ? _self.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String,
      safeMode: null == safeMode
          ? _self.safeMode
          : safeMode // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _GameSettings implements GameSettings {
  const _GameSettings(
      {required this.playersCount,
      required this.difficulty,
      required this.plot,
      required this.safeMode,
      required this.language,
      required this.time});

  @override
  final int playersCount;
  @override
  final int difficulty;
  @override
  final String plot;
  @override
  final bool safeMode;
  @override
  final String language;
  @override
  final int time;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameSettingsCopyWith<_GameSettings> get copyWith =>
      __$GameSettingsCopyWithImpl<_GameSettings>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameSettings &&
            (identical(other.playersCount, playersCount) ||
                other.playersCount == playersCount) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.plot, plot) || other.plot == plot) &&
            (identical(other.safeMode, safeMode) ||
                other.safeMode == safeMode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, playersCount, difficulty, plot, safeMode, language, time);

  @override
  String toString() {
    return 'GameSettings(playersCount: $playersCount, difficulty: $difficulty, plot: $plot, safeMode: $safeMode, language: $language, time: $time)';
  }
}

/// @nodoc
abstract mixin class _$GameSettingsCopyWith<$Res>
    implements $GameSettingsCopyWith<$Res> {
  factory _$GameSettingsCopyWith(
          _GameSettings value, $Res Function(_GameSettings) _then) =
      __$GameSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int playersCount,
      int difficulty,
      String plot,
      bool safeMode,
      String language,
      int time});
}

/// @nodoc
class __$GameSettingsCopyWithImpl<$Res>
    implements _$GameSettingsCopyWith<$Res> {
  __$GameSettingsCopyWithImpl(this._self, this._then);

  final _GameSettings _self;
  final $Res Function(_GameSettings) _then;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playersCount = null,
    Object? difficulty = null,
    Object? plot = null,
    Object? safeMode = null,
    Object? language = null,
    Object? time = null,
  }) {
    return _then(_GameSettings(
      playersCount: null == playersCount
          ? _self.playersCount
          : playersCount // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _self.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      plot: null == plot
          ? _self.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String,
      safeMode: null == safeMode
          ? _self.safeMode
          : safeMode // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
