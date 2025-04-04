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
  int get id;
  String get name;
  String get profession;
  String get bio;
  String get health;
  String get hobby;
  String get phobia;
  String get luggage;
  String get extra;
  LifeStatus get lifeStatus;
  List<bool> get knownProperties;
  List<String> get notes;

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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.hobby, hobby) || other.hobby == hobby) &&
            (identical(other.phobia, phobia) || other.phobia == phobia) &&
            (identical(other.luggage, luggage) || other.luggage == luggage) &&
            (identical(other.extra, extra) || other.extra == extra) &&
            (identical(other.lifeStatus, lifeStatus) ||
                other.lifeStatus == lifeStatus) &&
            const DeepCollectionEquality()
                .equals(other.knownProperties, knownProperties) &&
            const DeepCollectionEquality().equals(other.notes, notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      profession,
      bio,
      health,
      hobby,
      phobia,
      luggage,
      extra,
      lifeStatus,
      const DeepCollectionEquality().hash(knownProperties),
      const DeepCollectionEquality().hash(notes));

  @override
  String toString() {
    return 'Player(id: $id, name: $name, profession: $profession, bio: $bio, health: $health, hobby: $hobby, phobia: $phobia, luggage: $luggage, extra: $extra, lifeStatus: $lifeStatus, knownProperties: $knownProperties, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) _then) =
      _$PlayerCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String profession,
      String bio,
      String health,
      String hobby,
      String phobia,
      String luggage,
      String extra,
      LifeStatus lifeStatus,
      List<bool> knownProperties,
      List<String> notes});
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
    Object? id = null,
    Object? name = null,
    Object? profession = null,
    Object? bio = null,
    Object? health = null,
    Object? hobby = null,
    Object? phobia = null,
    Object? luggage = null,
    Object? extra = null,
    Object? lifeStatus = null,
    Object? knownProperties = null,
    Object? notes = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      lifeStatus: null == lifeStatus
          ? _self.lifeStatus
          : lifeStatus // ignore: cast_nullable_to_non_nullable
              as LifeStatus,
      knownProperties: null == knownProperties
          ? _self.knownProperties
          : knownProperties // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      notes: null == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _Player implements Player {
  const _Player(
      {required this.id,
      required this.name,
      required this.profession,
      required this.bio,
      required this.health,
      required this.hobby,
      required this.phobia,
      required this.luggage,
      required this.extra,
      required this.lifeStatus,
      required final List<bool> knownProperties,
      required final List<String> notes})
      : _knownProperties = knownProperties,
        _notes = notes;

  @override
  final int id;
  @override
  final String name;
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
  @override
  final LifeStatus lifeStatus;
  final List<bool> _knownProperties;
  @override
  List<bool> get knownProperties {
    if (_knownProperties is EqualUnmodifiableListView) return _knownProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knownProperties);
  }

  final List<String> _notes;
  @override
  List<String> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.hobby, hobby) || other.hobby == hobby) &&
            (identical(other.phobia, phobia) || other.phobia == phobia) &&
            (identical(other.luggage, luggage) || other.luggage == luggage) &&
            (identical(other.extra, extra) || other.extra == extra) &&
            (identical(other.lifeStatus, lifeStatus) ||
                other.lifeStatus == lifeStatus) &&
            const DeepCollectionEquality()
                .equals(other._knownProperties, _knownProperties) &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      profession,
      bio,
      health,
      hobby,
      phobia,
      luggage,
      extra,
      lifeStatus,
      const DeepCollectionEquality().hash(_knownProperties),
      const DeepCollectionEquality().hash(_notes));

  @override
  String toString() {
    return 'Player(id: $id, name: $name, profession: $profession, bio: $bio, health: $health, hobby: $hobby, phobia: $phobia, luggage: $luggage, extra: $extra, lifeStatus: $lifeStatus, knownProperties: $knownProperties, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) _then) =
      __$PlayerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String profession,
      String bio,
      String health,
      String hobby,
      String phobia,
      String luggage,
      String extra,
      LifeStatus lifeStatus,
      List<bool> knownProperties,
      List<String> notes});
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
    Object? id = null,
    Object? name = null,
    Object? profession = null,
    Object? bio = null,
    Object? health = null,
    Object? hobby = null,
    Object? phobia = null,
    Object? luggage = null,
    Object? extra = null,
    Object? lifeStatus = null,
    Object? knownProperties = null,
    Object? notes = null,
  }) {
    return _then(_Player(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      lifeStatus: null == lifeStatus
          ? _self.lifeStatus
          : lifeStatus // ignore: cast_nullable_to_non_nullable
              as LifeStatus,
      knownProperties: null == knownProperties
          ? _self._knownProperties
          : knownProperties // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      notes: null == notes
          ? _self._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
