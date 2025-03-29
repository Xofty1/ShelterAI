// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disaster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Disaster {
  String get name;
  String get disasterDescription;
  String get disasterShortDescription;
  String get shelterName;
  String get location;
  String get description;
  int get capacity;
  List<String> get rooms;
  List<String> get resources;

  /// Create a copy of Disaster
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DisasterCopyWith<Disaster> get copyWith =>
      _$DisasterCopyWithImpl<Disaster>(this as Disaster, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Disaster &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.disasterDescription, disasterDescription) ||
                other.disasterDescription == disasterDescription) &&
            (identical(
                    other.disasterShortDescription, disasterShortDescription) ||
                other.disasterShortDescription == disasterShortDescription) &&
            (identical(other.shelterName, shelterName) ||
                other.shelterName == shelterName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            const DeepCollectionEquality().equals(other.rooms, rooms) &&
            const DeepCollectionEquality().equals(other.resources, resources));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      disasterDescription,
      disasterShortDescription,
      shelterName,
      location,
      description,
      capacity,
      const DeepCollectionEquality().hash(rooms),
      const DeepCollectionEquality().hash(resources));

  @override
  String toString() {
    return 'Disaster(name: $name, disasterDescription: $disasterDescription, disasterShortDescription: $disasterShortDescription, shelterName: $shelterName, location: $location, description: $description, capacity: $capacity, rooms: $rooms, resources: $resources)';
  }
}

/// @nodoc
abstract mixin class $DisasterCopyWith<$Res> {
  factory $DisasterCopyWith(Disaster value, $Res Function(Disaster) _then) =
      _$DisasterCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String disasterDescription,
      String disasterShortDescription,
      String shelterName,
      String location,
      String description,
      int capacity,
      List<String> rooms,
      List<String> resources});
}

/// @nodoc
class _$DisasterCopyWithImpl<$Res> implements $DisasterCopyWith<$Res> {
  _$DisasterCopyWithImpl(this._self, this._then);

  final Disaster _self;
  final $Res Function(Disaster) _then;

  /// Create a copy of Disaster
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? disasterDescription = null,
    Object? disasterShortDescription = null,
    Object? shelterName = null,
    Object? location = null,
    Object? description = null,
    Object? capacity = null,
    Object? rooms = null,
    Object? resources = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      disasterDescription: null == disasterDescription
          ? _self.disasterDescription
          : disasterDescription // ignore: cast_nullable_to_non_nullable
              as String,
      disasterShortDescription: null == disasterShortDescription
          ? _self.disasterShortDescription
          : disasterShortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      shelterName: null == shelterName
          ? _self.shelterName
          : shelterName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      rooms: null == rooms
          ? _self.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resources: null == resources
          ? _self.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _Disaster implements Disaster {
  const _Disaster(
      {required this.name,
      required this.disasterDescription,
      required this.disasterShortDescription,
      required this.shelterName,
      required this.location,
      required this.description,
      required this.capacity,
      required final List<String> rooms,
      required final List<String> resources})
      : _rooms = rooms,
        _resources = resources;

  @override
  final String name;
  @override
  final String disasterDescription;
  @override
  final String disasterShortDescription;
  @override
  final String shelterName;
  @override
  final String location;
  @override
  final String description;
  @override
  final int capacity;
  final List<String> _rooms;
  @override
  List<String> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  final List<String> _resources;
  @override
  List<String> get resources {
    if (_resources is EqualUnmodifiableListView) return _resources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

  /// Create a copy of Disaster
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DisasterCopyWith<_Disaster> get copyWith =>
      __$DisasterCopyWithImpl<_Disaster>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Disaster &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.disasterDescription, disasterDescription) ||
                other.disasterDescription == disasterDescription) &&
            (identical(
                    other.disasterShortDescription, disasterShortDescription) ||
                other.disasterShortDescription == disasterShortDescription) &&
            (identical(other.shelterName, shelterName) ||
                other.shelterName == shelterName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      disasterDescription,
      disasterShortDescription,
      shelterName,
      location,
      description,
      capacity,
      const DeepCollectionEquality().hash(_rooms),
      const DeepCollectionEquality().hash(_resources));

  @override
  String toString() {
    return 'Disaster(name: $name, disasterDescription: $disasterDescription, disasterShortDescription: $disasterShortDescription, shelterName: $shelterName, location: $location, description: $description, capacity: $capacity, rooms: $rooms, resources: $resources)';
  }
}

/// @nodoc
abstract mixin class _$DisasterCopyWith<$Res>
    implements $DisasterCopyWith<$Res> {
  factory _$DisasterCopyWith(_Disaster value, $Res Function(_Disaster) _then) =
      __$DisasterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String disasterDescription,
      String disasterShortDescription,
      String shelterName,
      String location,
      String description,
      int capacity,
      List<String> rooms,
      List<String> resources});
}

/// @nodoc
class __$DisasterCopyWithImpl<$Res> implements _$DisasterCopyWith<$Res> {
  __$DisasterCopyWithImpl(this._self, this._then);

  final _Disaster _self;
  final $Res Function(_Disaster) _then;

  /// Create a copy of Disaster
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? disasterDescription = null,
    Object? disasterShortDescription = null,
    Object? shelterName = null,
    Object? location = null,
    Object? description = null,
    Object? capacity = null,
    Object? rooms = null,
    Object? resources = null,
  }) {
    return _then(_Disaster(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      disasterDescription: null == disasterDescription
          ? _self.disasterDescription
          : disasterDescription // ignore: cast_nullable_to_non_nullable
              as String,
      disasterShortDescription: null == disasterShortDescription
          ? _self.disasterShortDescription
          : disasterShortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      shelterName: null == shelterName
          ? _self.shelterName
          : shelterName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      rooms: null == rooms
          ? _self._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resources: null == resources
          ? _self._resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
