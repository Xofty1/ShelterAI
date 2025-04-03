// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_decoder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Story _$StoryFromJson(Map<String, dynamic> json) => _Story(
      player_amount: (json['player_amount'] as num).toInt(),
      language: json['language'] as String,
      family_mode: json['family_mode'] as bool,
      wishes: json['wishes'] as String,
      disaster: DisasterJs.fromJson(json['disaster'] as Map<String, dynamic>),
      short_description: json['short_description'] as String,
      bunker: Bunker.fromJson(json['bunker'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryToJson(_Story instance) => <String, dynamic>{
      'player_amount': instance.player_amount,
      'language': instance.language,
      'family_mode': instance.family_mode,
      'wishes': instance.wishes,
      'disaster': instance.disaster.toJson(),
      'short_description': instance.short_description,
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
      world_situation: json['world_situation'] as String,
    );

Map<String, dynamic> _$DisasterJsToJson(_DisasterJs instance) =>
    <String, dynamic>{
      'name': instance.name,
      'history': instance.history,
      'distribution': instance.distribution,
      'world_situation': instance.world_situation,
    };

_PlayersJs _$PlayersJsFromJson(Map<String, dynamic> json) => _PlayersJs(
      player_cards: (json['player_cards'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$PlayersJsToJson(_PlayersJs instance) =>
    <String, dynamic>{
      'player_cards': instance.player_cards,
    };

_PlayerCard _$PlayerCardFromJson(Map<String, dynamic> json) => _PlayerCard(
      profession: json['profession'] as String,
      age: json['age'] as String,
      health: json['health'] as String,
      hobby_skills: json['hobby_skills'] as String,
      phobias: json['phobias'] as String,
      baggage: json['baggage'] as String,
      additional_information: json['additional_information'] as String,
    );

Map<String, dynamic> _$PlayerCardToJson(_PlayerCard instance) =>
    <String, dynamic>{
      'profession': instance.profession,
      'age': instance.age,
      'health': instance.health,
      'hobby_skills': instance.hobby_skills,
      'phobias': instance.phobias,
      'baggage': instance.baggage,
      'additional_information': instance.additional_information,
    };
