// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayersJs _$PlayersJsFromJson(Map<String, dynamic> json) => _PlayersJs(
      playerCards: (json['player_cards'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$PlayersJsToJson(_PlayersJs instance) =>
    <String, dynamic>{
      'player_cards': instance.playerCards,
    };

_PlayerCard _$PlayerCardFromJson(Map<String, dynamic> json) => _PlayerCard(
      profession: json['profession'] as String,
      age: json['age'] as String,
      health: json['health'] as String,
      hobbySkills: json['hobby_skills'] as String,
      phobias: json['phobias'] as String,
      baggage: json['baggage'] as String,
      additionalInformation: json['additional_information'] as String,
    );

Map<String, dynamic> _$PlayerCardToJson(_PlayerCard instance) =>
    <String, dynamic>{
      'profession': instance.profession,
      'age': instance.age,
      'health': instance.health,
      'hobby_skills': instance.hobbySkills,
      'phobias': instance.phobias,
      'baggage': instance.baggage,
      'additional_information': instance.additionalInformation,
    };
