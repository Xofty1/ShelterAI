// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoteInfo _$VoteInfoFromJson(Map<String, dynamic> json) => _VoteInfo(
      votes: (json['votes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      canBeSelected: (json['canBeSelected'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      selectedIndexes: (json['selectedIndexes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      voteStatus: $enumDecode(_$VoteStatusEnumMap, json['voteStatus']),
    );

Map<String, dynamic> _$VoteInfoToJson(_VoteInfo instance) => <String, dynamic>{
      'votes': instance.votes,
      'canBeSelected': instance.canBeSelected,
      'selectedIndexes': instance.selectedIndexes,
      'voteStatus': _$VoteStatusEnumMap[instance.voteStatus]!,
    };

const _$VoteStatusEnumMap = {
  VoteStatus.none: 'none',
  VoteStatus.running: 'running',
  VoteStatus.reRunning: 'reRunning',
  VoteStatus.successful: 'successful',
};
