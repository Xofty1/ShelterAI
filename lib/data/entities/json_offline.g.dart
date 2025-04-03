// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_offline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DataReader _$DataReaderFromJson(Map<String, dynamic> json) => _DataReader(
      ru: Family.fromJson(json['ru'] as Map<String, dynamic>),
      en: Family.fromJson(json['en'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataReaderToJson(_DataReader instance) =>
    <String, dynamic>{
      'ru': instance.ru.toJson(),
      'en': instance.en.toJson(),
    };

_Family _$FamilyFromJson(Map<String, dynamic> json) => _Family(
      no: (json['no'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
      yes: (json['yes'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FamilyToJson(_Family instance) => <String, dynamic>{
      'no': instance.no.map((e) => e.toJson()).toList(),
      'yes': instance.yes.map((e) => e.toJson()).toList(),
    };
