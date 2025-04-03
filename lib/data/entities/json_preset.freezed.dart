// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_preset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Preset {
  Characteristics get ru;
  Characteristics get en;

  /// Create a copy of Preset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PresetCopyWith<Preset> get copyWith =>
      _$PresetCopyWithImpl<Preset>(this as Preset, _$identity);

  /// Serializes this Preset to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Preset &&
            (identical(other.ru, ru) || other.ru == ru) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ru, en);

  @override
  String toString() {
    return 'Preset(ru: $ru, en: $en)';
  }
}

/// @nodoc
abstract mixin class $PresetCopyWith<$Res> {
  factory $PresetCopyWith(Preset value, $Res Function(Preset) _then) =
      _$PresetCopyWithImpl;
  @useResult
  $Res call({Characteristics ru, Characteristics en});

  $CharacteristicsCopyWith<$Res> get ru;
  $CharacteristicsCopyWith<$Res> get en;
}

/// @nodoc
class _$PresetCopyWithImpl<$Res> implements $PresetCopyWith<$Res> {
  _$PresetCopyWithImpl(this._self, this._then);

  final Preset _self;
  final $Res Function(Preset) _then;

  /// Create a copy of Preset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ru = null,
    Object? en = null,
  }) {
    return _then(_self.copyWith(
      ru: null == ru
          ? _self.ru
          : ru // ignore: cast_nullable_to_non_nullable
              as Characteristics,
      en: null == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as Characteristics,
    ));
  }

  /// Create a copy of Preset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacteristicsCopyWith<$Res> get ru {
    return $CharacteristicsCopyWith<$Res>(_self.ru, (value) {
      return _then(_self.copyWith(ru: value));
    });
  }

  /// Create a copy of Preset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacteristicsCopyWith<$Res> get en {
    return $CharacteristicsCopyWith<$Res>(_self.en, (value) {
      return _then(_self.copyWith(en: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Preset implements Preset {
  const _Preset({required this.ru, required this.en});
  factory _Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);

  @override
  final Characteristics ru;
  @override
  final Characteristics en;

  /// Create a copy of Preset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PresetCopyWith<_Preset> get copyWith =>
      __$PresetCopyWithImpl<_Preset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PresetToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Preset &&
            (identical(other.ru, ru) || other.ru == ru) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ru, en);

  @override
  String toString() {
    return 'Preset(ru: $ru, en: $en)';
  }
}

/// @nodoc
abstract mixin class _$PresetCopyWith<$Res> implements $PresetCopyWith<$Res> {
  factory _$PresetCopyWith(_Preset value, $Res Function(_Preset) _then) =
      __$PresetCopyWithImpl;
  @override
  @useResult
  $Res call({Characteristics ru, Characteristics en});

  @override
  $CharacteristicsCopyWith<$Res> get ru;
  @override
  $CharacteristicsCopyWith<$Res> get en;
}

/// @nodoc
class __$PresetCopyWithImpl<$Res> implements _$PresetCopyWith<$Res> {
  __$PresetCopyWithImpl(this._self, this._then);

  final _Preset _self;
  final $Res Function(_Preset) _then;

  /// Create a copy of Preset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ru = null,
    Object? en = null,
  }) {
    return _then(_Preset(
      ru: null == ru
          ? _self.ru
          : ru // ignore: cast_nullable_to_non_nullable
              as Characteristics,
      en: null == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as Characteristics,
    ));
  }

  /// Create a copy of Preset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacteristicsCopyWith<$Res> get ru {
    return $CharacteristicsCopyWith<$Res>(_self.ru, (value) {
      return _then(_self.copyWith(ru: value));
    });
  }

  /// Create a copy of Preset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacteristicsCopyWith<$Res> get en {
    return $CharacteristicsCopyWith<$Res>(_self.en, (value) {
      return _then(_self.copyWith(en: value));
    });
  }
}

/// @nodoc
mixin _$Characteristics {
  List<String> get profession;
  List<String> get age;
  List<String> get health;
  @JsonKey(name: 'hobby_skills')
  List<String> get hobbySkills;
  List<String> get phobias;
  List<String> get baggage;
  @JsonKey(name: 'additional_information')
  String get additionalInformation;

  /// Create a copy of Characteristics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharacteristicsCopyWith<Characteristics> get copyWith =>
      _$CharacteristicsCopyWithImpl<Characteristics>(
          this as Characteristics, _$identity);

  /// Serializes this Characteristics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Characteristics &&
            const DeepCollectionEquality()
                .equals(other.profession, profession) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.health, health) &&
            const DeepCollectionEquality()
                .equals(other.hobbySkills, hobbySkills) &&
            const DeepCollectionEquality().equals(other.phobias, phobias) &&
            const DeepCollectionEquality().equals(other.baggage, baggage) &&
            (identical(other.additionalInformation, additionalInformation) ||
                other.additionalInformation == additionalInformation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(profession),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(health),
      const DeepCollectionEquality().hash(hobbySkills),
      const DeepCollectionEquality().hash(phobias),
      const DeepCollectionEquality().hash(baggage),
      additionalInformation);

  @override
  String toString() {
    return 'Characteristics(profession: $profession, age: $age, health: $health, hobbySkills: $hobbySkills, phobias: $phobias, baggage: $baggage, additionalInformation: $additionalInformation)';
  }
}

/// @nodoc
abstract mixin class $CharacteristicsCopyWith<$Res> {
  factory $CharacteristicsCopyWith(
          Characteristics value, $Res Function(Characteristics) _then) =
      _$CharacteristicsCopyWithImpl;
  @useResult
  $Res call(
      {List<String> profession,
      List<String> age,
      List<String> health,
      @JsonKey(name: 'hobby_skills') List<String> hobbySkills,
      List<String> phobias,
      List<String> baggage,
      @JsonKey(name: 'additional_information') String additionalInformation});
}

/// @nodoc
class _$CharacteristicsCopyWithImpl<$Res>
    implements $CharacteristicsCopyWith<$Res> {
  _$CharacteristicsCopyWithImpl(this._self, this._then);

  final Characteristics _self;
  final $Res Function(Characteristics) _then;

  /// Create a copy of Characteristics
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
              as List<String>,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as List<String>,
      health: null == health
          ? _self.health
          : health // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hobbySkills: null == hobbySkills
          ? _self.hobbySkills
          : hobbySkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phobias: null == phobias
          ? _self.phobias
          : phobias // ignore: cast_nullable_to_non_nullable
              as List<String>,
      baggage: null == baggage
          ? _self.baggage
          : baggage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      additionalInformation: null == additionalInformation
          ? _self.additionalInformation
          : additionalInformation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Characteristics implements Characteristics {
  const _Characteristics(
      {required final List<String> profession,
      required final List<String> age,
      required final List<String> health,
      @JsonKey(name: 'hobby_skills') required final List<String> hobbySkills,
      required final List<String> phobias,
      required final List<String> baggage,
      @JsonKey(name: 'additional_information')
      required this.additionalInformation})
      : _profession = profession,
        _age = age,
        _health = health,
        _hobbySkills = hobbySkills,
        _phobias = phobias,
        _baggage = baggage;
  factory _Characteristics.fromJson(Map<String, dynamic> json) =>
      _$CharacteristicsFromJson(json);

  final List<String> _profession;
  @override
  List<String> get profession {
    if (_profession is EqualUnmodifiableListView) return _profession;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profession);
  }

  final List<String> _age;
  @override
  List<String> get age {
    if (_age is EqualUnmodifiableListView) return _age;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_age);
  }

  final List<String> _health;
  @override
  List<String> get health {
    if (_health is EqualUnmodifiableListView) return _health;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_health);
  }

  final List<String> _hobbySkills;
  @override
  @JsonKey(name: 'hobby_skills')
  List<String> get hobbySkills {
    if (_hobbySkills is EqualUnmodifiableListView) return _hobbySkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hobbySkills);
  }

  final List<String> _phobias;
  @override
  List<String> get phobias {
    if (_phobias is EqualUnmodifiableListView) return _phobias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phobias);
  }

  final List<String> _baggage;
  @override
  List<String> get baggage {
    if (_baggage is EqualUnmodifiableListView) return _baggage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_baggage);
  }

  @override
  @JsonKey(name: 'additional_information')
  final String additionalInformation;

  /// Create a copy of Characteristics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CharacteristicsCopyWith<_Characteristics> get copyWith =>
      __$CharacteristicsCopyWithImpl<_Characteristics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CharacteristicsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Characteristics &&
            const DeepCollectionEquality()
                .equals(other._profession, _profession) &&
            const DeepCollectionEquality().equals(other._age, _age) &&
            const DeepCollectionEquality().equals(other._health, _health) &&
            const DeepCollectionEquality()
                .equals(other._hobbySkills, _hobbySkills) &&
            const DeepCollectionEquality().equals(other._phobias, _phobias) &&
            const DeepCollectionEquality().equals(other._baggage, _baggage) &&
            (identical(other.additionalInformation, additionalInformation) ||
                other.additionalInformation == additionalInformation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_profession),
      const DeepCollectionEquality().hash(_age),
      const DeepCollectionEquality().hash(_health),
      const DeepCollectionEquality().hash(_hobbySkills),
      const DeepCollectionEquality().hash(_phobias),
      const DeepCollectionEquality().hash(_baggage),
      additionalInformation);

  @override
  String toString() {
    return 'Characteristics(profession: $profession, age: $age, health: $health, hobbySkills: $hobbySkills, phobias: $phobias, baggage: $baggage, additionalInformation: $additionalInformation)';
  }
}

/// @nodoc
abstract mixin class _$CharacteristicsCopyWith<$Res>
    implements $CharacteristicsCopyWith<$Res> {
  factory _$CharacteristicsCopyWith(
          _Characteristics value, $Res Function(_Characteristics) _then) =
      __$CharacteristicsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<String> profession,
      List<String> age,
      List<String> health,
      @JsonKey(name: 'hobby_skills') List<String> hobbySkills,
      List<String> phobias,
      List<String> baggage,
      @JsonKey(name: 'additional_information') String additionalInformation});
}

/// @nodoc
class __$CharacteristicsCopyWithImpl<$Res>
    implements _$CharacteristicsCopyWith<$Res> {
  __$CharacteristicsCopyWithImpl(this._self, this._then);

  final _Characteristics _self;
  final $Res Function(_Characteristics) _then;

  /// Create a copy of Characteristics
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
    return _then(_Characteristics(
      profession: null == profession
          ? _self._profession
          : profession // ignore: cast_nullable_to_non_nullable
              as List<String>,
      age: null == age
          ? _self._age
          : age // ignore: cast_nullable_to_non_nullable
              as List<String>,
      health: null == health
          ? _self._health
          : health // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hobbySkills: null == hobbySkills
          ? _self._hobbySkills
          : hobbySkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phobias: null == phobias
          ? _self._phobias
          : phobias // ignore: cast_nullable_to_non_nullable
              as List<String>,
      baggage: null == baggage
          ? _self._baggage
          : baggage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      additionalInformation: null == additionalInformation
          ? _self.additionalInformation
          : additionalInformation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
