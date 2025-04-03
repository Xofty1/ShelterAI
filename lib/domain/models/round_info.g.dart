// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoundInfo _$RoundInfoFromJson(Map<String, dynamic> json) => _RoundInfo(
      roundNumber: (json['roundNumber'] as num).toInt(),
      kickedCount: (json['kickedCount'] as num).toInt(),
      openCount: (json['openCount'] as num).toInt(),
    );

Map<String, dynamic> _$RoundInfoToJson(_RoundInfo instance) =>
    <String, dynamic>{
      'roundNumber': instance.roundNumber,
      'kickedCount': instance.kickedCount,
      'openCount': instance.openCount,
    };
