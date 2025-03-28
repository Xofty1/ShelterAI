// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {
  int get volume;
  int get music;
  int get effects;
  String get loc;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppSettings &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.music, music) || other.music == music) &&
            (identical(other.effects, effects) || other.effects == effects) &&
            (identical(other.loc, loc) || other.loc == loc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, volume, music, effects, loc);

  @override
  String toString() {
    return 'AppSettings(volume: $volume, music: $music, effects: $effects, loc: $loc)';
  }
}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) _then) =
      _$AppSettingsCopyWithImpl;
  @useResult
  $Res call({int volume, int music, int effects, String loc});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res> implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volume = null,
    Object? music = null,
    Object? effects = null,
    Object? loc = null,
  }) {
    return _then(_self.copyWith(
      volume: null == volume
          ? _self.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      music: null == music
          ? _self.music
          : music // ignore: cast_nullable_to_non_nullable
              as int,
      effects: null == effects
          ? _self.effects
          : effects // ignore: cast_nullable_to_non_nullable
              as int,
      loc: null == loc
          ? _self.loc
          : loc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AppSettings implements AppSettings {
  _AppSettings(
      {required this.volume,
      required this.music,
      required this.effects,
      required this.loc});

  @override
  final int volume;
  @override
  final int music;
  @override
  final int effects;
  @override
  final String loc;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppSettings &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.music, music) || other.music == music) &&
            (identical(other.effects, effects) || other.effects == effects) &&
            (identical(other.loc, loc) || other.loc == loc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, volume, music, effects, loc);

  @override
  String toString() {
    return 'AppSettings(volume: $volume, music: $music, effects: $effects, loc: $loc)';
  }
}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(
          _AppSettings value, $Res Function(_AppSettings) _then) =
      __$AppSettingsCopyWithImpl;
  @override
  @useResult
  $Res call({int volume, int music, int effects, String loc});
}

/// @nodoc
class __$AppSettingsCopyWithImpl<$Res> implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? volume = null,
    Object? music = null,
    Object? effects = null,
    Object? loc = null,
  }) {
    return _then(_AppSettings(
      volume: null == volume
          ? _self.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      music: null == music
          ? _self.music
          : music // ignore: cast_nullable_to_non_nullable
              as int,
      effects: null == effects
          ? _self.effects
          : effects // ignore: cast_nullable_to_non_nullable
              as int,
      loc: null == loc
          ? _self.loc
          : loc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
