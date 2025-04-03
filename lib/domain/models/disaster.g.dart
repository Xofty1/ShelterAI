// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disaster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Disaster _$DisasterFromJson(Map<String, dynamic> json) => _Disaster(
      name: json['name'] as String,
      disasterDescription: json['disasterDescription'] as String,
      disasterShortDescription: json['disasterShortDescription'] as String,
      shelterName: json['shelterName'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      capacity: (json['capacity'] as num).toInt(),
      rooms: (json['rooms'] as List<dynamic>).map((e) => e as String).toList(),
      resources:
          (json['resources'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DisasterToJson(_Disaster instance) => <String, dynamic>{
      'name': instance.name,
      'disasterDescription': instance.disasterDescription,
      'disasterShortDescription': instance.disasterShortDescription,
      'shelterName': instance.shelterName,
      'location': instance.location,
      'description': instance.description,
      'capacity': instance.capacity,
      'rooms': instance.rooms,
      'resources': instance.resources,
    };
