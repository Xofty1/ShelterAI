// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoundInfo {
  int get roundNumber;
  int get kickedCount;
  int get openCount;

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoundInfoCopyWith<RoundInfo> get copyWith =>
      _$RoundInfoCopyWithImpl<RoundInfo>(this as RoundInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoundInfo &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.kickedCount, kickedCount) ||
                other.kickedCount == kickedCount) &&
            (identical(other.openCount, openCount) ||
                other.openCount == openCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, roundNumber, kickedCount, openCount);

  @override
  String toString() {
    return 'RoundInfo(roundNumber: $roundNumber, kickedCount: $kickedCount, openCount: $openCount)';
  }
}

/// @nodoc
abstract mixin class $RoundInfoCopyWith<$Res> {
  factory $RoundInfoCopyWith(RoundInfo value, $Res Function(RoundInfo) _then) =
      _$RoundInfoCopyWithImpl;
  @useResult
  $Res call({int roundNumber, int kickedCount, int openCount});
}

/// @nodoc
class _$RoundInfoCopyWithImpl<$Res> implements $RoundInfoCopyWith<$Res> {
  _$RoundInfoCopyWithImpl(this._self, this._then);

  final RoundInfo _self;
  final $Res Function(RoundInfo) _then;

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roundNumber = null,
    Object? kickedCount = null,
    Object? openCount = null,
  }) {
    return _then(_self.copyWith(
      roundNumber: null == roundNumber
          ? _self.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      kickedCount: null == kickedCount
          ? _self.kickedCount
          : kickedCount // ignore: cast_nullable_to_non_nullable
              as int,
      openCount: null == openCount
          ? _self.openCount
          : openCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _RoundInfo implements RoundInfo {
  const _RoundInfo(
      {required this.roundNumber,
      required this.kickedCount,
      required this.openCount});

  @override
  final int roundNumber;
  @override
  final int kickedCount;
  @override
  final int openCount;

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoundInfoCopyWith<_RoundInfo> get copyWith =>
      __$RoundInfoCopyWithImpl<_RoundInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoundInfo &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.kickedCount, kickedCount) ||
                other.kickedCount == kickedCount) &&
            (identical(other.openCount, openCount) ||
                other.openCount == openCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, roundNumber, kickedCount, openCount);

  @override
  String toString() {
    return 'RoundInfo(roundNumber: $roundNumber, kickedCount: $kickedCount, openCount: $openCount)';
  }
}

/// @nodoc
abstract mixin class _$RoundInfoCopyWith<$Res>
    implements $RoundInfoCopyWith<$Res> {
  factory _$RoundInfoCopyWith(
          _RoundInfo value, $Res Function(_RoundInfo) _then) =
      __$RoundInfoCopyWithImpl;
  @override
  @useResult
  $Res call({int roundNumber, int kickedCount, int openCount});
}

/// @nodoc
class __$RoundInfoCopyWithImpl<$Res> implements _$RoundInfoCopyWith<$Res> {
  __$RoundInfoCopyWithImpl(this._self, this._then);

  final _RoundInfo _self;
  final $Res Function(_RoundInfo) _then;

  /// Create a copy of RoundInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? roundNumber = null,
    Object? kickedCount = null,
    Object? openCount = null,
  }) {
    return _then(_RoundInfo(
      roundNumber: null == roundNumber
          ? _self.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      kickedCount: null == kickedCount
          ? _self.kickedCount
          : kickedCount // ignore: cast_nullable_to_non_nullable
              as int,
      openCount: null == openCount
          ? _self.openCount
          : openCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
