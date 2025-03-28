// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Player {
  String get name;
  LifeStatus get lifeStatus;
  String get profession;
  String get bio;
  String get health;
  String get hobby;
  String get phobia;
  String get luggage;
  String get extra;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<Player> get copyWith =>
      _$PlayerCopyWithImpl<Player>(this as Player, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Player &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lifeStatus, lifeStatus) ||
                other.lifeStatus == lifeStatus) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.hobby, hobby) || other.hobby == hobby) &&
            (identical(other.phobia, phobia) || other.phobia == phobia) &&
            (identical(other.luggage, luggage) || other.luggage == luggage) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, lifeStatus, profession,
      bio, health, hobby, phobia, luggage, extra);

  @override
  String toString() {
    return 'Player(name: $name, lifeStatus: $lifeStatus, profession: $profession, bio: $bio, health: $health, hobby: $hobby, phobia: $phobia, luggage: $luggage, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) _then) =
      _$PlayerCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      LifeStatus lifeStatus,
      String profession,
      String bio,
      String health,
      String hobby,
      String phobia,
      String luggage,
      String extra});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._self, this._then);

  final Player _self;
  final $Res Function(Player) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lifeStatus = null,
    Object? profession = null,
    Object? bio = null,
    Object? health = null,
    Object? hobby = null,
    Object? phobia = null,
    Object? luggage = null,
    Object? extra = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lifeStatus: null == lifeStatus
          ? _self.lifeStatus
          : lifeStatus // ignore: cast_nullable_to_non_nullable
              as LifeStatus,
      profession: null == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      health: null == health
          ? _self.health
          : health // ignore: cast_nullable_to_non_nullable
              as String,
      hobby: null == hobby
          ? _self.hobby
          : hobby // ignore: cast_nullable_to_non_nullable
              as String,
      phobia: null == phobia
          ? _self.phobia
          : phobia // ignore: cast_nullable_to_non_nullable
              as String,
      luggage: null == luggage
          ? _self.luggage
          : luggage // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Player implements Player {
  const _Player(
      {required this.name,
      required this.lifeStatus,
      required this.profession,
      required this.bio,
      required this.health,
      required this.hobby,
      required this.phobia,
      required this.luggage,
      required this.extra});

  @override
  final String name;
  @override
  final LifeStatus lifeStatus;
  @override
  final String profession;
  @override
  final String bio;
  @override
  final String health;
  @override
  final String hobby;
  @override
  final String phobia;
  @override
  final String luggage;
  @override
  final String extra;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Player &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lifeStatus, lifeStatus) ||
                other.lifeStatus == lifeStatus) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.hobby, hobby) || other.hobby == hobby) &&
            (identical(other.phobia, phobia) || other.phobia == phobia) &&
            (identical(other.luggage, luggage) || other.luggage == luggage) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, lifeStatus, profession,
      bio, health, hobby, phobia, luggage, extra);

  @override
  String toString() {
    return 'Player(name: $name, lifeStatus: $lifeStatus, profession: $profession, bio: $bio, health: $health, hobby: $hobby, phobia: $phobia, luggage: $luggage, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) _then) =
      __$PlayerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      LifeStatus lifeStatus,
      String profession,
      String bio,
      String health,
      String hobby,
      String phobia,
      String luggage,
      String extra});
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(this._self, this._then);

  final _Player _self;
  final $Res Function(_Player) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? lifeStatus = null,
    Object? profession = null,
    Object? bio = null,
    Object? health = null,
    Object? hobby = null,
    Object? phobia = null,
    Object? luggage = null,
    Object? extra = null,
  }) {
    return _then(_Player(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lifeStatus: null == lifeStatus
          ? _self.lifeStatus
          : lifeStatus // ignore: cast_nullable_to_non_nullable
              as LifeStatus,
      profession: null == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      health: null == health
          ? _self.health
          : health // ignore: cast_nullable_to_non_nullable
              as String,
      hobby: null == hobby
          ? _self.hobby
          : hobby // ignore: cast_nullable_to_non_nullable
              as String,
      phobia: null == phobia
          ? _self.phobia
          : phobia // ignore: cast_nullable_to_non_nullable
              as String,
      luggage: null == luggage
          ? _self.luggage
          : luggage // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
