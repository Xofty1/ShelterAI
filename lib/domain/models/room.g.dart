// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
      gameSettings:
          GameSettings.fromJson(json['gameSettings'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      password: json['password'] as String,
      currentPlayerIndex: (json['currentPlayerIndex'] as num).toInt(),
      voteInfo: VoteInfo.fromJson(json['voteInfo'] as Map<String, dynamic>),
      roundInfo: RoundInfo.fromJson(json['roundInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
      'gameSettings': instance.gameSettings,
      'players': instance.players,
      'password': instance.password,
      'currentPlayerIndex': instance.currentPlayerIndex,
      'voteInfo': instance.voteInfo,
      'roundInfo': instance.roundInfo,
    };
