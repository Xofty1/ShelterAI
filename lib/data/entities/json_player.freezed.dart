// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayersJs {
  @JsonKey(name: 'player_cards')
  List<Map<String, dynamic>> get playerCards;

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
                .equals(other.playerCards, playerCards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(playerCards));

  @override
  String toString() {
    return 'PlayersJs(playerCards: $playerCards)';
  }
}

/// @nodoc
abstract mixin class $PlayersJsCopyWith<$Res> {
  factory $PlayersJsCopyWith(PlayersJs value, $Res Function(PlayersJs) _then) =
      _$PlayersJsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'player_cards') List<Map<String, dynamic>> playerCards});
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
    Object? playerCards = null,
  }) {
    return _then(_self.copyWith(
      playerCards: null == playerCards
          ? _self.playerCards
          : playerCards // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PlayersJs implements PlayersJs {
  const _PlayersJs(
      {@JsonKey(name: 'player_cards')
      required final List<Map<String, dynamic>> playerCards})
      : _playerCards = playerCards;
  factory _PlayersJs.fromJson(Map<String, dynamic> json) =>
      _$PlayersJsFromJson(json);

  final List<Map<String, dynamic>> _playerCards;
  @override
  @JsonKey(name: 'player_cards')
  List<Map<String, dynamic>> get playerCards {
    if (_playerCards is EqualUnmodifiableListView) return _playerCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerCards);
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
                .equals(other._playerCards, _playerCards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_playerCards));

  @override
  String toString() {
    return 'PlayersJs(playerCards: $playerCards)';
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
  $Res call(
      {@JsonKey(name: 'player_cards') List<Map<String, dynamic>> playerCards});
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
    Object? playerCards = null,
  }) {
    return _then(_PlayersJs(
      playerCards: null == playerCards
          ? _self._playerCards
          : playerCards // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
mixin _$PlayerCard {
  String get profession;
  String get age;
  String get health;
  @JsonKey(name: 'hobby_skills')
  String get hobbySkills;
  String get phobias;
  String get baggage;
  @JsonKey(name: 'additional_information')
  String get additionalInformation;

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
            (identical(other.hobbySkills, hobbySkills) ||
                other.hobbySkills == hobbySkills) &&
            (identical(other.phobias, phobias) || other.phobias == phobias) &&
            (identical(other.baggage, baggage) || other.baggage == baggage) &&
            (identical(other.additionalInformation, additionalInformation) ||
                other.additionalInformation == additionalInformation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, profession, age, health,
      hobbySkills, phobias, baggage, additionalInformation);

  @override
  String toString() {
    return 'PlayerCard(profession: $profession, age: $age, health: $health, hobbySkills: $hobbySkills, phobias: $phobias, baggage: $baggage, additionalInformation: $additionalInformation)';
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
      @JsonKey(name: 'hobby_skills') String hobbySkills,
      String phobias,
      String baggage,
      @JsonKey(name: 'additional_information') String additionalInformation});
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
    Object? hobbySkills = null,
    Object? phobias = null,
    Object? baggage = null,
    Object? additionalInformation = null,
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
      hobbySkills: null == hobbySkills
          ? _self.hobbySkills
          : hobbySkills // ignore: cast_nullable_to_non_nullable
              as String,
      phobias: null == phobias
          ? _self.phobias
          : phobias // ignore: cast_nullable_to_non_nullable
              as String,
      baggage: null == baggage
          ? _self.baggage
          : baggage // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInformation: null == additionalInformation
          ? _self.additionalInformation
          : additionalInformation // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'hobby_skills') required this.hobbySkills,
      required this.phobias,
      required this.baggage,
      @JsonKey(name: 'additional_information')
      required this.additionalInformation});
  factory _PlayerCard.fromJson(Map<String, dynamic> json) =>
      _$PlayerCardFromJson(json);

  @override
  final String profession;
  @override
  final String age;
  @override
  final String health;
  @override
  @JsonKey(name: 'hobby_skills')
  final String hobbySkills;
  @override
  final String phobias;
  @override
  final String baggage;
  @override
  @JsonKey(name: 'additional_information')
  final String additionalInformation;

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
            (identical(other.hobbySkills, hobbySkills) ||
                other.hobbySkills == hobbySkills) &&
            (identical(other.phobias, phobias) || other.phobias == phobias) &&
            (identical(other.baggage, baggage) || other.baggage == baggage) &&
            (identical(other.additionalInformation, additionalInformation) ||
                other.additionalInformation == additionalInformation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, profession, age, health,
      hobbySkills, phobias, baggage, additionalInformation);

  @override
  String toString() {
    return 'PlayerCard(profession: $profession, age: $age, health: $health, hobbySkills: $hobbySkills, phobias: $phobias, baggage: $baggage, additionalInformation: $additionalInformation)';
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
      @JsonKey(name: 'hobby_skills') String hobbySkills,
      String phobias,
      String baggage,
      @JsonKey(name: 'additional_information') String additionalInformation});
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
    Object? hobbySkills = null,
    Object? phobias = null,
    Object? baggage = null,
    Object? additionalInformation = null,
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
      hobbySkills: null == hobbySkills
          ? _self.hobbySkills
          : hobbySkills // ignore: cast_nullable_to_non_nullable
              as String,
      phobias: null == phobias
          ? _self.phobias
          : phobias // ignore: cast_nullable_to_non_nullable
              as String,
      baggage: null == baggage
          ? _self.baggage
          : baggage // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInformation: null == additionalInformation
          ? _self.additionalInformation
          : additionalInformation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
