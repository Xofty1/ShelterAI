// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Story _$StoryFromJson(Map<String, dynamic> json) => _Story(
      playerAmount: (json['player_amount'] as num).toInt(),
      language: json['language'] as String,
      familyMode: json['family_mode'] as bool,
      wishes: json['wishes'] as String,
      disaster: DisasterJs.fromJson(json['disaster'] as Map<String, dynamic>),
      shortDescription: json['short_description'] as String,
      bunker: Bunker.fromJson(json['bunker'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryToJson(_Story instance) => <String, dynamic>{
      'player_amount': instance.playerAmount,
      'language': instance.language,
      'family_mode': instance.familyMode,
      'wishes': instance.wishes,
      'disaster': instance.disaster.toJson(),
      'short_description': instance.shortDescription,
      'bunker': instance.bunker.toJson(),
    };

_Bunker _$BunkerFromJson(Map<String, dynamic> json) => _Bunker(
      name: json['name'] as String,
      location: json['location'] as String,
      capacity: json['capacity'] as String,
      rooms: (json['rooms'] as List<dynamic>).map((e) => e as String).toList(),
      resources:
          (json['resources'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BunkerToJson(_Bunker instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'capacity': instance.capacity,
      'rooms': instance.rooms,
      'resources': instance.resources,
    };

_DisasterJs _$DisasterJsFromJson(Map<String, dynamic> json) => _DisasterJs(
      name: json['name'] as String,
      history: json['history'] as String,
      distribution: json['distribution'] as String,
      worldSituation: json['world_situation'] as String,
    );

Map<String, dynamic> _$DisasterJsToJson(_DisasterJs instance) =>
    <String, dynamic>{
      'name': instance.name,
      'history': instance.history,
      'distribution': instance.distribution,
      'world_situation': instance.worldSituation,
    };
