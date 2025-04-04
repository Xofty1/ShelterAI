// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_preset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Preset _$PresetFromJson(Map<String, dynamic> json) => _Preset(
      ru: Characteristics.fromJson(json['ru'] as Map<String, dynamic>),
      en: Characteristics.fromJson(json['en'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PresetToJson(_Preset instance) => <String, dynamic>{
      'ru': instance.ru.toJson(),
      'en': instance.en.toJson(),
    };

_Characteristics _$CharacteristicsFromJson(Map<String, dynamic> json) =>
    _Characteristics(
      profession: (json['profession'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      age: (json['age'] as List<dynamic>).map((e) => e as String).toList(),
      health:
          (json['health'] as List<dynamic>).map((e) => e as String).toList(),
      hobbySkills: (json['hobby_skills'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      phobias:
          (json['phobias'] as List<dynamic>).map((e) => e as String).toList(),
      baggage:
          (json['baggage'] as List<dynamic>).map((e) => e as String).toList(),
      additionalInformation: json['additional_information'] as String,
    );

Map<String, dynamic> _$CharacteristicsToJson(_Characteristics instance) =>
    <String, dynamic>{
      'profession': instance.profession,
      'age': instance.age,
      'health': instance.health,
      'hobby_skills': instance.hobbySkills,
      'phobias': instance.phobias,
      'baggage': instance.baggage,
      'additional_information': instance.additionalInformation,
    };
