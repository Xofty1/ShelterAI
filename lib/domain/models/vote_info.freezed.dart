// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoteInfo {
// Голоса (по индексам)
  List<int> get votes; // Могут ли быть выбраны в голосовании
// Необходимо для переголосования, список с информацией:
// можно выбрать игрока или нельзя
  List<bool> get canBeSelected; // Победители голосования (их индексы)
  List<int> get selectedIndexes; // Статус голосования
  VoteStatus get voteStatus;

  /// Create a copy of VoteInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VoteInfoCopyWith<VoteInfo> get copyWith =>
      _$VoteInfoCopyWithImpl<VoteInfo>(this as VoteInfo, _$identity);

  /// Serializes this VoteInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VoteInfo &&
            const DeepCollectionEquality().equals(other.votes, votes) &&
            const DeepCollectionEquality()
                .equals(other.canBeSelected, canBeSelected) &&
            const DeepCollectionEquality()
                .equals(other.selectedIndexes, selectedIndexes) &&
            (identical(other.voteStatus, voteStatus) ||
                other.voteStatus == voteStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(votes),
      const DeepCollectionEquality().hash(canBeSelected),
      const DeepCollectionEquality().hash(selectedIndexes),
      voteStatus);

  @override
  String toString() {
    return 'VoteInfo(votes: $votes, canBeSelected: $canBeSelected, selectedIndexes: $selectedIndexes, voteStatus: $voteStatus)';
  }
}

/// @nodoc
abstract mixin class $VoteInfoCopyWith<$Res> {
  factory $VoteInfoCopyWith(VoteInfo value, $Res Function(VoteInfo) _then) =
      _$VoteInfoCopyWithImpl;
  @useResult
  $Res call(
      {List<int> votes,
      List<bool> canBeSelected,
      List<int> selectedIndexes,
      VoteStatus voteStatus});
}

/// @nodoc
class _$VoteInfoCopyWithImpl<$Res> implements $VoteInfoCopyWith<$Res> {
  _$VoteInfoCopyWithImpl(this._self, this._then);

  final VoteInfo _self;
  final $Res Function(VoteInfo) _then;

  /// Create a copy of VoteInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? votes = null,
    Object? canBeSelected = null,
    Object? selectedIndexes = null,
    Object? voteStatus = null,
  }) {
    return _then(_self.copyWith(
      votes: null == votes
          ? _self.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      canBeSelected: null == canBeSelected
          ? _self.canBeSelected
          : canBeSelected // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      selectedIndexes: null == selectedIndexes
          ? _self.selectedIndexes
          : selectedIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      voteStatus: null == voteStatus
          ? _self.voteStatus
          : voteStatus // ignore: cast_nullable_to_non_nullable
              as VoteStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VoteInfo implements VoteInfo {
  const _VoteInfo(
      {required final List<int> votes,
      required final List<bool> canBeSelected,
      required final List<int> selectedIndexes,
      required this.voteStatus})
      : _votes = votes,
        _canBeSelected = canBeSelected,
        _selectedIndexes = selectedIndexes;
  factory _VoteInfo.fromJson(Map<String, dynamic> json) =>
      _$VoteInfoFromJson(json);

// Голоса (по индексам)
  final List<int> _votes;
// Голоса (по индексам)
  @override
  List<int> get votes {
    if (_votes is EqualUnmodifiableListView) return _votes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_votes);
  }

// Могут ли быть выбраны в голосовании
// Необходимо для переголосования, список с информацией:
// можно выбрать игрока или нельзя
  final List<bool> _canBeSelected;
// Могут ли быть выбраны в голосовании
// Необходимо для переголосования, список с информацией:
// можно выбрать игрока или нельзя
  @override
  List<bool> get canBeSelected {
    if (_canBeSelected is EqualUnmodifiableListView) return _canBeSelected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_canBeSelected);
  }

// Победители голосования (их индексы)
  final List<int> _selectedIndexes;
// Победители голосования (их индексы)
  @override
  List<int> get selectedIndexes {
    if (_selectedIndexes is EqualUnmodifiableListView) return _selectedIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIndexes);
  }

// Статус голосования
  @override
  final VoteStatus voteStatus;

  /// Create a copy of VoteInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VoteInfoCopyWith<_VoteInfo> get copyWith =>
      __$VoteInfoCopyWithImpl<_VoteInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VoteInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VoteInfo &&
            const DeepCollectionEquality().equals(other._votes, _votes) &&
            const DeepCollectionEquality()
                .equals(other._canBeSelected, _canBeSelected) &&
            const DeepCollectionEquality()
                .equals(other._selectedIndexes, _selectedIndexes) &&
            (identical(other.voteStatus, voteStatus) ||
                other.voteStatus == voteStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_votes),
      const DeepCollectionEquality().hash(_canBeSelected),
      const DeepCollectionEquality().hash(_selectedIndexes),
      voteStatus);

  @override
  String toString() {
    return 'VoteInfo(votes: $votes, canBeSelected: $canBeSelected, selectedIndexes: $selectedIndexes, voteStatus: $voteStatus)';
  }
}

/// @nodoc
abstract mixin class _$VoteInfoCopyWith<$Res>
    implements $VoteInfoCopyWith<$Res> {
  factory _$VoteInfoCopyWith(_VoteInfo value, $Res Function(_VoteInfo) _then) =
      __$VoteInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<int> votes,
      List<bool> canBeSelected,
      List<int> selectedIndexes,
      VoteStatus voteStatus});
}

/// @nodoc
class __$VoteInfoCopyWithImpl<$Res> implements _$VoteInfoCopyWith<$Res> {
  __$VoteInfoCopyWithImpl(this._self, this._then);

  final _VoteInfo _self;
  final $Res Function(_VoteInfo) _then;

  /// Create a copy of VoteInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? votes = null,
    Object? canBeSelected = null,
    Object? selectedIndexes = null,
    Object? voteStatus = null,
  }) {
    return _then(_VoteInfo(
      votes: null == votes
          ? _self._votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      canBeSelected: null == canBeSelected
          ? _self._canBeSelected
          : canBeSelected // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      selectedIndexes: null == selectedIndexes
          ? _self._selectedIndexes
          : selectedIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      voteStatus: null == voteStatus
          ? _self.voteStatus
          : voteStatus // ignore: cast_nullable_to_non_nullable
              as VoteStatus,
    ));
  }
}

// dart format on
