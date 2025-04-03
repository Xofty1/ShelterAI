// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_offline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataReader {
  Family get ru;
  Family get en;

  /// Create a copy of DataReader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataReaderCopyWith<DataReader> get copyWith =>
      _$DataReaderCopyWithImpl<DataReader>(this as DataReader, _$identity);

  /// Serializes this DataReader to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataReader &&
            (identical(other.ru, ru) || other.ru == ru) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ru, en);

  @override
  String toString() {
    return 'DataReader(ru: $ru, en: $en)';
  }
}

/// @nodoc
abstract mixin class $DataReaderCopyWith<$Res> {
  factory $DataReaderCopyWith(
          DataReader value, $Res Function(DataReader) _then) =
      _$DataReaderCopyWithImpl;
  @useResult
  $Res call({Family ru, Family en});

  $FamilyCopyWith<$Res> get ru;
  $FamilyCopyWith<$Res> get en;
}

/// @nodoc
class _$DataReaderCopyWithImpl<$Res> implements $DataReaderCopyWith<$Res> {
  _$DataReaderCopyWithImpl(this._self, this._then);

  final DataReader _self;
  final $Res Function(DataReader) _then;

  /// Create a copy of DataReader
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
              as Family,
      en: null == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as Family,
    ));
  }

  /// Create a copy of DataReader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FamilyCopyWith<$Res> get ru {
    return $FamilyCopyWith<$Res>(_self.ru, (value) {
      return _then(_self.copyWith(ru: value));
    });
  }

  /// Create a copy of DataReader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FamilyCopyWith<$Res> get en {
    return $FamilyCopyWith<$Res>(_self.en, (value) {
      return _then(_self.copyWith(en: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DataReader implements DataReader {
  const _DataReader({required this.ru, required this.en});
  factory _DataReader.fromJson(Map<String, dynamic> json) =>
      _$DataReaderFromJson(json);

  @override
  final Family ru;
  @override
  final Family en;

  /// Create a copy of DataReader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataReaderCopyWith<_DataReader> get copyWith =>
      __$DataReaderCopyWithImpl<_DataReader>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataReaderToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataReader &&
            (identical(other.ru, ru) || other.ru == ru) &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ru, en);

  @override
  String toString() {
    return 'DataReader(ru: $ru, en: $en)';
  }
}

/// @nodoc
abstract mixin class _$DataReaderCopyWith<$Res>
    implements $DataReaderCopyWith<$Res> {
  factory _$DataReaderCopyWith(
          _DataReader value, $Res Function(_DataReader) _then) =
      __$DataReaderCopyWithImpl;
  @override
  @useResult
  $Res call({Family ru, Family en});

  @override
  $FamilyCopyWith<$Res> get ru;
  @override
  $FamilyCopyWith<$Res> get en;
}

/// @nodoc
class __$DataReaderCopyWithImpl<$Res> implements _$DataReaderCopyWith<$Res> {
  __$DataReaderCopyWithImpl(this._self, this._then);

  final _DataReader _self;
  final $Res Function(_DataReader) _then;

  /// Create a copy of DataReader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ru = null,
    Object? en = null,
  }) {
    return _then(_DataReader(
      ru: null == ru
          ? _self.ru
          : ru // ignore: cast_nullable_to_non_nullable
              as Family,
      en: null == en
          ? _self.en
          : en // ignore: cast_nullable_to_non_nullable
              as Family,
    ));
  }

  /// Create a copy of DataReader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FamilyCopyWith<$Res> get ru {
    return $FamilyCopyWith<$Res>(_self.ru, (value) {
      return _then(_self.copyWith(ru: value));
    });
  }

  /// Create a copy of DataReader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FamilyCopyWith<$Res> get en {
    return $FamilyCopyWith<$Res>(_self.en, (value) {
      return _then(_self.copyWith(en: value));
    });
  }
}

/// @nodoc
mixin _$Family {
  List<Story> get no;
  List<Story> get yes;

  /// Create a copy of Family
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FamilyCopyWith<Family> get copyWith =>
      _$FamilyCopyWithImpl<Family>(this as Family, _$identity);

  /// Serializes this Family to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Family &&
            const DeepCollectionEquality().equals(other.no, no) &&
            const DeepCollectionEquality().equals(other.yes, yes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(no),
      const DeepCollectionEquality().hash(yes));

  @override
  String toString() {
    return 'Family(no: $no, yes: $yes)';
  }
}

/// @nodoc
abstract mixin class $FamilyCopyWith<$Res> {
  factory $FamilyCopyWith(Family value, $Res Function(Family) _then) =
      _$FamilyCopyWithImpl;
  @useResult
  $Res call({List<Story> no, List<Story> yes});
}

/// @nodoc
class _$FamilyCopyWithImpl<$Res> implements $FamilyCopyWith<$Res> {
  _$FamilyCopyWithImpl(this._self, this._then);

  final Family _self;
  final $Res Function(Family) _then;

  /// Create a copy of Family
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? yes = null,
  }) {
    return _then(_self.copyWith(
      no: null == no
          ? _self.no
          : no // ignore: cast_nullable_to_non_nullable
              as List<Story>,
      yes: null == yes
          ? _self.yes
          : yes // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Family implements Family {
  const _Family({required final List<Story> no, required final List<Story> yes})
      : _no = no,
        _yes = yes;
  factory _Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);

  final List<Story> _no;
  @override
  List<Story> get no {
    if (_no is EqualUnmodifiableListView) return _no;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_no);
  }

  final List<Story> _yes;
  @override
  List<Story> get yes {
    if (_yes is EqualUnmodifiableListView) return _yes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yes);
  }

  /// Create a copy of Family
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FamilyCopyWith<_Family> get copyWith =>
      __$FamilyCopyWithImpl<_Family>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FamilyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Family &&
            const DeepCollectionEquality().equals(other._no, _no) &&
            const DeepCollectionEquality().equals(other._yes, _yes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_no),
      const DeepCollectionEquality().hash(_yes));

  @override
  String toString() {
    return 'Family(no: $no, yes: $yes)';
  }
}

/// @nodoc
abstract mixin class _$FamilyCopyWith<$Res> implements $FamilyCopyWith<$Res> {
  factory _$FamilyCopyWith(_Family value, $Res Function(_Family) _then) =
      __$FamilyCopyWithImpl;
  @override
  @useResult
  $Res call({List<Story> no, List<Story> yes});
}

/// @nodoc
class __$FamilyCopyWithImpl<$Res> implements _$FamilyCopyWith<$Res> {
  __$FamilyCopyWithImpl(this._self, this._then);

  final _Family _self;
  final $Res Function(_Family) _then;

  /// Create a copy of Family
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? no = null,
    Object? yes = null,
  }) {
    return _then(_Family(
      no: null == no
          ? _self._no
          : no // ignore: cast_nullable_to_non_nullable
              as List<Story>,
      yes: null == yes
          ? _self._yes
          : yes // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ));
  }
}

// dart format on
