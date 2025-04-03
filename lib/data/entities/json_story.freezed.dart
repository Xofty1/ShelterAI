// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Story {
  @JsonKey(name: 'player_amount')
  int get playerAmount;
  String get language;
  @JsonKey(name: 'family_mode')
  bool get familyMode;
  String get wishes;
  DisasterJs get disaster;
  @JsonKey(name: 'short_description')
  String get shortDescription;
  Bunker get bunker;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoryCopyWith<Story> get copyWith =>
      _$StoryCopyWithImpl<Story>(this as Story, _$identity);

  /// Serializes this Story to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Story &&
            (identical(other.playerAmount, playerAmount) ||
                other.playerAmount == playerAmount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.familyMode, familyMode) ||
                other.familyMode == familyMode) &&
            (identical(other.wishes, wishes) || other.wishes == wishes) &&
            (identical(other.disaster, disaster) ||
                other.disaster == disaster) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.bunker, bunker) || other.bunker == bunker));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerAmount, language,
      familyMode, wishes, disaster, shortDescription, bunker);

  @override
  String toString() {
    return 'Story(playerAmount: $playerAmount, language: $language, familyMode: $familyMode, wishes: $wishes, disaster: $disaster, shortDescription: $shortDescription, bunker: $bunker)';
  }
}

/// @nodoc
abstract mixin class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) _then) =
      _$StoryCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'player_amount') int playerAmount,
      String language,
      @JsonKey(name: 'family_mode') bool familyMode,
      String wishes,
      DisasterJs disaster,
      @JsonKey(name: 'short_description') String shortDescription,
      Bunker bunker});

  $DisasterJsCopyWith<$Res> get disaster;
  $BunkerCopyWith<$Res> get bunker;
}

/// @nodoc
class _$StoryCopyWithImpl<$Res> implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._self, this._then);

  final Story _self;
  final $Res Function(Story) _then;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerAmount = null,
    Object? language = null,
    Object? familyMode = null,
    Object? wishes = null,
    Object? disaster = null,
    Object? shortDescription = null,
    Object? bunker = null,
  }) {
    return _then(_self.copyWith(
      playerAmount: null == playerAmount
          ? _self.playerAmount
          : playerAmount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      familyMode: null == familyMode
          ? _self.familyMode
          : familyMode // ignore: cast_nullable_to_non_nullable
              as bool,
      wishes: null == wishes
          ? _self.wishes
          : wishes // ignore: cast_nullable_to_non_nullable
              as String,
      disaster: null == disaster
          ? _self.disaster
          : disaster // ignore: cast_nullable_to_non_nullable
              as DisasterJs,
      shortDescription: null == shortDescription
          ? _self.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      bunker: null == bunker
          ? _self.bunker
          : bunker // ignore: cast_nullable_to_non_nullable
              as Bunker,
    ));
  }

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisasterJsCopyWith<$Res> get disaster {
    return $DisasterJsCopyWith<$Res>(_self.disaster, (value) {
      return _then(_self.copyWith(disaster: value));
    });
  }

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BunkerCopyWith<$Res> get bunker {
    return $BunkerCopyWith<$Res>(_self.bunker, (value) {
      return _then(_self.copyWith(bunker: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Story implements Story {
  const _Story(
      {@JsonKey(name: 'player_amount') required this.playerAmount,
      required this.language,
      @JsonKey(name: 'family_mode') required this.familyMode,
      required this.wishes,
      required this.disaster,
      @JsonKey(name: 'short_description') required this.shortDescription,
      required this.bunker});
  factory _Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  @override
  @JsonKey(name: 'player_amount')
  final int playerAmount;
  @override
  final String language;
  @override
  @JsonKey(name: 'family_mode')
  final bool familyMode;
  @override
  final String wishes;
  @override
  final DisasterJs disaster;
  @override
  @JsonKey(name: 'short_description')
  final String shortDescription;
  @override
  final Bunker bunker;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StoryCopyWith<_Story> get copyWith =>
      __$StoryCopyWithImpl<_Story>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Story &&
            (identical(other.playerAmount, playerAmount) ||
                other.playerAmount == playerAmount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.familyMode, familyMode) ||
                other.familyMode == familyMode) &&
            (identical(other.wishes, wishes) || other.wishes == wishes) &&
            (identical(other.disaster, disaster) ||
                other.disaster == disaster) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.bunker, bunker) || other.bunker == bunker));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerAmount, language,
      familyMode, wishes, disaster, shortDescription, bunker);

  @override
  String toString() {
    return 'Story(playerAmount: $playerAmount, language: $language, familyMode: $familyMode, wishes: $wishes, disaster: $disaster, shortDescription: $shortDescription, bunker: $bunker)';
  }
}

/// @nodoc
abstract mixin class _$StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$StoryCopyWith(_Story value, $Res Function(_Story) _then) =
      __$StoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'player_amount') int playerAmount,
      String language,
      @JsonKey(name: 'family_mode') bool familyMode,
      String wishes,
      DisasterJs disaster,
      @JsonKey(name: 'short_description') String shortDescription,
      Bunker bunker});

  @override
  $DisasterJsCopyWith<$Res> get disaster;
  @override
  $BunkerCopyWith<$Res> get bunker;
}

/// @nodoc
class __$StoryCopyWithImpl<$Res> implements _$StoryCopyWith<$Res> {
  __$StoryCopyWithImpl(this._self, this._then);

  final _Story _self;
  final $Res Function(_Story) _then;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playerAmount = null,
    Object? language = null,
    Object? familyMode = null,
    Object? wishes = null,
    Object? disaster = null,
    Object? shortDescription = null,
    Object? bunker = null,
  }) {
    return _then(_Story(
      playerAmount: null == playerAmount
          ? _self.playerAmount
          : playerAmount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      familyMode: null == familyMode
          ? _self.familyMode
          : familyMode // ignore: cast_nullable_to_non_nullable
              as bool,
      wishes: null == wishes
          ? _self.wishes
          : wishes // ignore: cast_nullable_to_non_nullable
              as String,
      disaster: null == disaster
          ? _self.disaster
          : disaster // ignore: cast_nullable_to_non_nullable
              as DisasterJs,
      shortDescription: null == shortDescription
          ? _self.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      bunker: null == bunker
          ? _self.bunker
          : bunker // ignore: cast_nullable_to_non_nullable
              as Bunker,
    ));
  }

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisasterJsCopyWith<$Res> get disaster {
    return $DisasterJsCopyWith<$Res>(_self.disaster, (value) {
      return _then(_self.copyWith(disaster: value));
    });
  }

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BunkerCopyWith<$Res> get bunker {
    return $BunkerCopyWith<$Res>(_self.bunker, (value) {
      return _then(_self.copyWith(bunker: value));
    });
  }
}

/// @nodoc
mixin _$Bunker {
  String get name;
  String get location;
  String get capacity;
  List<String> get rooms;
  List<String> get resources;

  /// Create a copy of Bunker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BunkerCopyWith<Bunker> get copyWith =>
      _$BunkerCopyWithImpl<Bunker>(this as Bunker, _$identity);

  /// Serializes this Bunker to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bunker &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            const DeepCollectionEquality().equals(other.rooms, rooms) &&
            const DeepCollectionEquality().equals(other.resources, resources));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      location,
      capacity,
      const DeepCollectionEquality().hash(rooms),
      const DeepCollectionEquality().hash(resources));

  @override
  String toString() {
    return 'Bunker(name: $name, location: $location, capacity: $capacity, rooms: $rooms, resources: $resources)';
  }
}

/// @nodoc
abstract mixin class $BunkerCopyWith<$Res> {
  factory $BunkerCopyWith(Bunker value, $Res Function(Bunker) _then) =
      _$BunkerCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String location,
      String capacity,
      List<String> rooms,
      List<String> resources});
}

/// @nodoc
class _$BunkerCopyWithImpl<$Res> implements $BunkerCopyWith<$Res> {
  _$BunkerCopyWithImpl(this._self, this._then);

  final Bunker _self;
  final $Res Function(Bunker) _then;

  /// Create a copy of Bunker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? location = null,
    Object? capacity = null,
    Object? rooms = null,
    Object? resources = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as String,
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

@JsonSerializable(explicitToJson: true)
class _Bunker implements Bunker {
  const _Bunker(
      {required this.name,
      required this.location,
      required this.capacity,
      required final List<String> rooms,
      required final List<String> resources})
      : _rooms = rooms,
        _resources = resources;
  factory _Bunker.fromJson(Map<String, dynamic> json) => _$BunkerFromJson(json);

  @override
  final String name;
  @override
  final String location;
  @override
  final String capacity;
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

  /// Create a copy of Bunker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BunkerCopyWith<_Bunker> get copyWith =>
      __$BunkerCopyWithImpl<_Bunker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BunkerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bunker &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      location,
      capacity,
      const DeepCollectionEquality().hash(_rooms),
      const DeepCollectionEquality().hash(_resources));

  @override
  String toString() {
    return 'Bunker(name: $name, location: $location, capacity: $capacity, rooms: $rooms, resources: $resources)';
  }
}

/// @nodoc
abstract mixin class _$BunkerCopyWith<$Res> implements $BunkerCopyWith<$Res> {
  factory _$BunkerCopyWith(_Bunker value, $Res Function(_Bunker) _then) =
      __$BunkerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String location,
      String capacity,
      List<String> rooms,
      List<String> resources});
}

/// @nodoc
class __$BunkerCopyWithImpl<$Res> implements _$BunkerCopyWith<$Res> {
  __$BunkerCopyWithImpl(this._self, this._then);

  final _Bunker _self;
  final $Res Function(_Bunker) _then;

  /// Create a copy of Bunker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? location = null,
    Object? capacity = null,
    Object? rooms = null,
    Object? resources = null,
  }) {
    return _then(_Bunker(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as String,
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

/// @nodoc
mixin _$DisasterJs {
  String get name;
  String get history;
  String get distribution;
  @JsonKey(name: 'world_situation')
  String get worldSituation;

  /// Create a copy of DisasterJs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DisasterJsCopyWith<DisasterJs> get copyWith =>
      _$DisasterJsCopyWithImpl<DisasterJs>(this as DisasterJs, _$identity);

  /// Serializes this DisasterJs to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DisasterJs &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.history, history) || other.history == history) &&
            (identical(other.distribution, distribution) ||
                other.distribution == distribution) &&
            (identical(other.worldSituation, worldSituation) ||
                other.worldSituation == worldSituation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, history, distribution, worldSituation);

  @override
  String toString() {
    return 'DisasterJs(name: $name, history: $history, distribution: $distribution, worldSituation: $worldSituation)';
  }
}

/// @nodoc
abstract mixin class $DisasterJsCopyWith<$Res> {
  factory $DisasterJsCopyWith(
          DisasterJs value, $Res Function(DisasterJs) _then) =
      _$DisasterJsCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String history,
      String distribution,
      @JsonKey(name: 'world_situation') String worldSituation});
}

/// @nodoc
class _$DisasterJsCopyWithImpl<$Res> implements $DisasterJsCopyWith<$Res> {
  _$DisasterJsCopyWithImpl(this._self, this._then);

  final DisasterJs _self;
  final $Res Function(DisasterJs) _then;

  /// Create a copy of DisasterJs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? history = null,
    Object? distribution = null,
    Object? worldSituation = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as String,
      distribution: null == distribution
          ? _self.distribution
          : distribution // ignore: cast_nullable_to_non_nullable
              as String,
      worldSituation: null == worldSituation
          ? _self.worldSituation
          : worldSituation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DisasterJs implements DisasterJs {
  const _DisasterJs(
      {required this.name,
      required this.history,
      required this.distribution,
      @JsonKey(name: 'world_situation') required this.worldSituation});
  factory _DisasterJs.fromJson(Map<String, dynamic> json) =>
      _$DisasterJsFromJson(json);

  @override
  final String name;
  @override
  final String history;
  @override
  final String distribution;
  @override
  @JsonKey(name: 'world_situation')
  final String worldSituation;

  /// Create a copy of DisasterJs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DisasterJsCopyWith<_DisasterJs> get copyWith =>
      __$DisasterJsCopyWithImpl<_DisasterJs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DisasterJsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisasterJs &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.history, history) || other.history == history) &&
            (identical(other.distribution, distribution) ||
                other.distribution == distribution) &&
            (identical(other.worldSituation, worldSituation) ||
                other.worldSituation == worldSituation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, history, distribution, worldSituation);

  @override
  String toString() {
    return 'DisasterJs(name: $name, history: $history, distribution: $distribution, worldSituation: $worldSituation)';
  }
}

/// @nodoc
abstract mixin class _$DisasterJsCopyWith<$Res>
    implements $DisasterJsCopyWith<$Res> {
  factory _$DisasterJsCopyWith(
          _DisasterJs value, $Res Function(_DisasterJs) _then) =
      __$DisasterJsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String history,
      String distribution,
      @JsonKey(name: 'world_situation') String worldSituation});
}

/// @nodoc
class __$DisasterJsCopyWithImpl<$Res> implements _$DisasterJsCopyWith<$Res> {
  __$DisasterJsCopyWithImpl(this._self, this._then);

  final _DisasterJs _self;
  final $Res Function(_DisasterJs) _then;

  /// Create a copy of DisasterJs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? history = null,
    Object? distribution = null,
    Object? worldSituation = null,
  }) {
    return _then(_DisasterJs(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as String,
      distribution: null == distribution
          ? _self.distribution
          : distribution // ignore: cast_nullable_to_non_nullable
              as String,
      worldSituation: null == worldSituation
          ? _self.worldSituation
          : worldSituation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
