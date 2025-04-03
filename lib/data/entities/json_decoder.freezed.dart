// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_decoder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Story {
  int get player_amount;
  String get language;
  bool get family_mode;
  String get wishes;
  DisasterJs get disaster;
  String get short_description;
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
            (identical(other.player_amount, player_amount) ||
                other.player_amount == player_amount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.family_mode, family_mode) ||
                other.family_mode == family_mode) &&
            (identical(other.wishes, wishes) || other.wishes == wishes) &&
            (identical(other.disaster, disaster) ||
                other.disaster == disaster) &&
            (identical(other.short_description, short_description) ||
                other.short_description == short_description) &&
            (identical(other.bunker, bunker) || other.bunker == bunker));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, player_amount, language,
      family_mode, wishes, disaster, short_description, bunker);

  @override
  String toString() {
    return 'Story(player_amount: $player_amount, language: $language, family_mode: $family_mode, wishes: $wishes, disaster: $disaster, short_description: $short_description, bunker: $bunker)';
  }
}

/// @nodoc
abstract mixin class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) _then) =
      _$StoryCopyWithImpl;
  @useResult
  $Res call(
      {int player_amount,
      String language,
      bool family_mode,
      String wishes,
      DisasterJs disaster,
      String short_description,
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
    Object? player_amount = null,
    Object? language = null,
    Object? family_mode = null,
    Object? wishes = null,
    Object? disaster = null,
    Object? short_description = null,
    Object? bunker = null,
  }) {
    return _then(_self.copyWith(
      player_amount: null == player_amount
          ? _self.player_amount
          : player_amount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      family_mode: null == family_mode
          ? _self.family_mode
          : family_mode // ignore: cast_nullable_to_non_nullable
              as bool,
      wishes: null == wishes
          ? _self.wishes
          : wishes // ignore: cast_nullable_to_non_nullable
              as String,
      disaster: null == disaster
          ? _self.disaster
          : disaster // ignore: cast_nullable_to_non_nullable
              as DisasterJs,
      short_description: null == short_description
          ? _self.short_description
          : short_description // ignore: cast_nullable_to_non_nullable
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
      {required this.player_amount,
      required this.language,
      required this.family_mode,
      required this.wishes,
      required this.disaster,
      required this.short_description,
      required this.bunker});
  factory _Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  @override
  final int player_amount;
  @override
  final String language;
  @override
  final bool family_mode;
  @override
  final String wishes;
  @override
  final DisasterJs disaster;
  @override
  final String short_description;
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
            (identical(other.player_amount, player_amount) ||
                other.player_amount == player_amount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.family_mode, family_mode) ||
                other.family_mode == family_mode) &&
            (identical(other.wishes, wishes) || other.wishes == wishes) &&
            (identical(other.disaster, disaster) ||
                other.disaster == disaster) &&
            (identical(other.short_description, short_description) ||
                other.short_description == short_description) &&
            (identical(other.bunker, bunker) || other.bunker == bunker));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, player_amount, language,
      family_mode, wishes, disaster, short_description, bunker);

  @override
  String toString() {
    return 'Story(player_amount: $player_amount, language: $language, family_mode: $family_mode, wishes: $wishes, disaster: $disaster, short_description: $short_description, bunker: $bunker)';
  }
}

/// @nodoc
abstract mixin class _$StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$StoryCopyWith(_Story value, $Res Function(_Story) _then) =
      __$StoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int player_amount,
      String language,
      bool family_mode,
      String wishes,
      DisasterJs disaster,
      String short_description,
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
    Object? player_amount = null,
    Object? language = null,
    Object? family_mode = null,
    Object? wishes = null,
    Object? disaster = null,
    Object? short_description = null,
    Object? bunker = null,
  }) {
    return _then(_Story(
      player_amount: null == player_amount
          ? _self.player_amount
          : player_amount // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      family_mode: null == family_mode
          ? _self.family_mode
          : family_mode // ignore: cast_nullable_to_non_nullable
              as bool,
      wishes: null == wishes
          ? _self.wishes
          : wishes // ignore: cast_nullable_to_non_nullable
              as String,
      disaster: null == disaster
          ? _self.disaster
          : disaster // ignore: cast_nullable_to_non_nullable
              as DisasterJs,
      short_description: null == short_description
          ? _self.short_description
          : short_description // ignore: cast_nullable_to_non_nullable
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
  String get world_situation;

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
            (identical(other.world_situation, world_situation) ||
                other.world_situation == world_situation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, history, distribution, world_situation);

  @override
  String toString() {
    return 'DisasterJs(name: $name, history: $history, distribution: $distribution, world_situation: $world_situation)';
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
      String world_situation});
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
    Object? world_situation = null,
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
      world_situation: null == world_situation
          ? _self.world_situation
          : world_situation // ignore: cast_nullable_to_non_nullable
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
      required this.world_situation});
  factory _DisasterJs.fromJson(Map<String, dynamic> json) =>
      _$DisasterJsFromJson(json);

  @override
  final String name;
  @override
  final String history;
  @override
  final String distribution;
  @override
  final String world_situation;

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
            (identical(other.world_situation, world_situation) ||
                other.world_situation == world_situation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, history, distribution, world_situation);

  @override
  String toString() {
    return 'DisasterJs(name: $name, history: $history, distribution: $distribution, world_situation: $world_situation)';
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
      String world_situation});
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
    Object? world_situation = null,
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
      world_situation: null == world_situation
          ? _self.world_situation
          : world_situation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PlayersJs {
  List<Map<String, dynamic>> get player_cards;

  /// Create a copy of PlayersJs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayersJsCopyWith<PlayersJs> get copyWith =>
      _$PlayersJsCopyWithImpl<PlayersJs>(this as PlayersJs, _$identity);

  /// Serializes this PlayersJs to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayersJs &&
            const DeepCollectionEquality()
                .equals(other.player_cards, player_cards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(player_cards));

  @override
  String toString() {
    return 'PlayersJs(player_cards: $player_cards)';
  }
}

/// @nodoc
abstract mixin class $PlayersJsCopyWith<$Res> {
  factory $PlayersJsCopyWith(PlayersJs value, $Res Function(PlayersJs) _then) =
      _$PlayersJsCopyWithImpl;
  @useResult
  $Res call({List<Map<String, dynamic>> player_cards});
}

/// @nodoc
class _$PlayersJsCopyWithImpl<$Res> implements $PlayersJsCopyWith<$Res> {
  _$PlayersJsCopyWithImpl(this._self, this._then);

  final PlayersJs _self;
  final $Res Function(PlayersJs) _then;

  /// Create a copy of PlayersJs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player_cards = null,
  }) {
    return _then(_self.copyWith(
      player_cards: null == player_cards
          ? _self.player_cards
          : player_cards // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PlayersJs implements PlayersJs {
  const _PlayersJs({required final List<Map<String, dynamic>> player_cards})
      : _player_cards = player_cards;
  factory _PlayersJs.fromJson(Map<String, dynamic> json) =>
      _$PlayersJsFromJson(json);

  final List<Map<String, dynamic>> _player_cards;
  @override
  List<Map<String, dynamic>> get player_cards {
    if (_player_cards is EqualUnmodifiableListView) return _player_cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_player_cards);
  }

  /// Create a copy of PlayersJs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayersJsCopyWith<_PlayersJs> get copyWith =>
      __$PlayersJsCopyWithImpl<_PlayersJs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlayersJsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayersJs &&
            const DeepCollectionEquality()
                .equals(other._player_cards, _player_cards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_player_cards));

  @override
  String toString() {
    return 'PlayersJs(player_cards: $player_cards)';
  }
}

/// @nodoc
abstract mixin class _$PlayersJsCopyWith<$Res>
    implements $PlayersJsCopyWith<$Res> {
  factory _$PlayersJsCopyWith(
          _PlayersJs value, $Res Function(_PlayersJs) _then) =
      __$PlayersJsCopyWithImpl;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> player_cards});
}

/// @nodoc
class __$PlayersJsCopyWithImpl<$Res> implements _$PlayersJsCopyWith<$Res> {
  __$PlayersJsCopyWithImpl(this._self, this._then);

  final _PlayersJs _self;
  final $Res Function(_PlayersJs) _then;

  /// Create a copy of PlayersJs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? player_cards = null,
  }) {
    return _then(_PlayersJs(
      player_cards: null == player_cards
          ? _self._player_cards
          : player_cards // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
mixin _$PlayerCard {
  String get profession;
  String get age;
  String get health;
  String get hobby_skills;
  String get phobias;
  String get baggage;
  String get additional_information;

  /// Create a copy of PlayerCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCardCopyWith<PlayerCard> get copyWith =>
      _$PlayerCardCopyWithImpl<PlayerCard>(this as PlayerCard, _$identity);

  /// Serializes this PlayerCard to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCard &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.hobby_skills, hobby_skills) ||
                other.hobby_skills == hobby_skills) &&
            (identical(other.phobias, phobias) || other.phobias == phobias) &&
            (identical(other.baggage, baggage) || other.baggage == baggage) &&
            (identical(other.additional_information, additional_information) ||
                other.additional_information == additional_information));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, profession, age, health,
      hobby_skills, phobias, baggage, additional_information);

  @override
  String toString() {
    return 'PlayerCard(profession: $profession, age: $age, health: $health, hobby_skills: $hobby_skills, phobias: $phobias, baggage: $baggage, additional_information: $additional_information)';
  }
}

/// @nodoc
abstract mixin class $PlayerCardCopyWith<$Res> {
  factory $PlayerCardCopyWith(
          PlayerCard value, $Res Function(PlayerCard) _then) =
      _$PlayerCardCopyWithImpl;
  @useResult
  $Res call(
      {String profession,
      String age,
      String health,
      String hobby_skills,
      String phobias,
      String baggage,
      String additional_information});
}

/// @nodoc
class _$PlayerCardCopyWithImpl<$Res> implements $PlayerCardCopyWith<$Res> {
  _$PlayerCardCopyWithImpl(this._self, this._then);

  final PlayerCard _self;
  final $Res Function(PlayerCard) _then;

  /// Create a copy of PlayerCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profession = null,
    Object? age = null,
    Object? health = null,
    Object? hobby_skills = null,
    Object? phobias = null,
    Object? baggage = null,
    Object? additional_information = null,
  }) {
    return _then(_self.copyWith(
      profession: null == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      health: null == health
          ? _self.health
          : health // ignore: cast_nullable_to_non_nullable
              as String,
      hobby_skills: null == hobby_skills
          ? _self.hobby_skills
          : hobby_skills // ignore: cast_nullable_to_non_nullable
              as String,
      phobias: null == phobias
          ? _self.phobias
          : phobias // ignore: cast_nullable_to_non_nullable
              as String,
      baggage: null == baggage
          ? _self.baggage
          : baggage // ignore: cast_nullable_to_non_nullable
              as String,
      additional_information: null == additional_information
          ? _self.additional_information
          : additional_information // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PlayerCard implements PlayerCard {
  const _PlayerCard(
      {required this.profession,
      required this.age,
      required this.health,
      required this.hobby_skills,
      required this.phobias,
      required this.baggage,
      required this.additional_information});
  factory _PlayerCard.fromJson(Map<String, dynamic> json) =>
      _$PlayerCardFromJson(json);

  @override
  final String profession;
  @override
  final String age;
  @override
  final String health;
  @override
  final String hobby_skills;
  @override
  final String phobias;
  @override
  final String baggage;
  @override
  final String additional_information;

  /// Create a copy of PlayerCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayerCardCopyWith<_PlayerCard> get copyWith =>
      __$PlayerCardCopyWithImpl<_PlayerCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlayerCardToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerCard &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.hobby_skills, hobby_skills) ||
                other.hobby_skills == hobby_skills) &&
            (identical(other.phobias, phobias) || other.phobias == phobias) &&
            (identical(other.baggage, baggage) || other.baggage == baggage) &&
            (identical(other.additional_information, additional_information) ||
                other.additional_information == additional_information));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, profession, age, health,
      hobby_skills, phobias, baggage, additional_information);

  @override
  String toString() {
    return 'PlayerCard(profession: $profession, age: $age, health: $health, hobby_skills: $hobby_skills, phobias: $phobias, baggage: $baggage, additional_information: $additional_information)';
  }
}

/// @nodoc
abstract mixin class _$PlayerCardCopyWith<$Res>
    implements $PlayerCardCopyWith<$Res> {
  factory _$PlayerCardCopyWith(
          _PlayerCard value, $Res Function(_PlayerCard) _then) =
      __$PlayerCardCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String profession,
      String age,
      String health,
      String hobby_skills,
      String phobias,
      String baggage,
      String additional_information});
}

/// @nodoc
class __$PlayerCardCopyWithImpl<$Res> implements _$PlayerCardCopyWith<$Res> {
  __$PlayerCardCopyWithImpl(this._self, this._then);

  final _PlayerCard _self;
  final $Res Function(_PlayerCard) _then;

  /// Create a copy of PlayerCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profession = null,
    Object? age = null,
    Object? health = null,
    Object? hobby_skills = null,
    Object? phobias = null,
    Object? baggage = null,
    Object? additional_information = null,
  }) {
    return _then(_PlayerCard(
      profession: null == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      health: null == health
          ? _self.health
          : health // ignore: cast_nullable_to_non_nullable
              as String,
      hobby_skills: null == hobby_skills
          ? _self.hobby_skills
          : hobby_skills // ignore: cast_nullable_to_non_nullable
              as String,
      phobias: null == phobias
          ? _self.phobias
          : phobias // ignore: cast_nullable_to_non_nullable
              as String,
      baggage: null == baggage
          ? _self.baggage
          : baggage // ignore: cast_nullable_to_non_nullable
              as String,
      additional_information: null == additional_information
          ? _self.additional_information
          : additional_information // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
