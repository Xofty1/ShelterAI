// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameSettings _$GameSettingsFromJson(Map<String, dynamic> json) =>
    _GameSettings(
      playersCount: (json['playersCount'] as num).toInt(),
      difficulty: (json['difficulty'] as num).toInt(),
      plot: json['plot'] as String,
      safeMode: json['safeMode'] as bool,
      language: json['language'] as String,
      time: (json['time'] as num).toInt(),
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$GameSettingsToJson(_GameSettings instance) =>
    <String, dynamic>{
      'playersCount': instance.playersCount,
      'difficulty': instance.difficulty,
      'plot': instance.plot,
      'safeMode': instance.safeMode,
      'language': instance.language,
      'time': instance.time,
      'isOnline': instance.isOnline,
    };
