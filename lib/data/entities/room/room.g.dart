// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
      gameState:
          RunningGameState.fromJson(json['gameState'] as Map<String, dynamic>),
      password: json['password'] as String,
      currentPlayerIndex: (json['currentPlayerIndex'] as num).toInt(),
      currentPlayerCounter: (json['currentPlayerCounter'] as num).toInt(),
      isBusy: (json['isBusy'] as List<dynamic>).map((e) => e as bool).toList(),
    );

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
      'gameState': instance.gameState,
      'password': instance.password,
      'currentPlayerIndex': instance.currentPlayerIndex,
      'currentPlayerCounter': instance.currentPlayerCounter,
      'isBusy': instance.isBusy,
    };
