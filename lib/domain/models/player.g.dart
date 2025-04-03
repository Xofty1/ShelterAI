// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Player _$PlayerFromJson(Map<String, dynamic> json) => _Player(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profession: json['profession'] as String,
      bio: json['bio'] as String,
      health: json['health'] as String,
      hobby: json['hobby'] as String,
      phobia: json['phobia'] as String,
      luggage: json['luggage'] as String,
      extra: json['extra'] as String,
      lifeStatus: $enumDecode(_$LifeStatusEnumMap, json['lifeStatus']),
      knownProperties: (json['knownProperties'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      notes: (json['notes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PlayerToJson(_Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profession': instance.profession,
      'bio': instance.bio,
      'health': instance.health,
      'hobby': instance.hobby,
      'phobia': instance.phobia,
      'luggage': instance.luggage,
      'extra': instance.extra,
      'lifeStatus': _$LifeStatusEnumMap[instance.lifeStatus]!,
      'knownProperties': instance.knownProperties,
      'notes': instance.notes,
    };

const _$LifeStatusEnumMap = {
  LifeStatus.alive: 'alive',
  LifeStatus.last: 'last',
  LifeStatus.killed: 'killed',
};
