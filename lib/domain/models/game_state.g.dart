// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameState _$GameStateFromJson(Map<String, dynamic> json) => _GameState(
      settings: GameSettings.fromJson(json['settings'] as Map<String, dynamic>),
      disaster: Disaster.fromJson(json['disaster'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      stage: $enumDecode(_$GameStageEnumMap, json['stage']),
      roundInfo: RoundInfo.fromJson(json['roundInfo'] as Map<String, dynamic>),
      voteInfo: VoteInfo.fromJson(json['voteInfo'] as Map<String, dynamic>),
      currentPlayerIndex: (json['currentPlayerIndex'] as num).toInt(),
      finals: json['finals'] as String,
    );

Map<String, dynamic> _$GameStateToJson(_GameState instance) =>
    <String, dynamic>{
      'stage': _$GameStageEnumMap[instance.stage]!,
      'settings': instance.settings,
      'disaster': instance.disaster,
      'players': instance.players,
      'roundInfo': instance.roundInfo,
      'voteInfo': instance.voteInfo,
      'currentPlayerIndex': instance.currentPlayerIndex,
      'finals': instance.finals,
    };

const _$GameStageEnumMap = {
  GameStage.waitingPlayers: 'waitingPlayers',
  GameStage.waiting: 'waiting',
  GameStage.intro: 'intro',
  GameStage.roundStarted: 'roundStarted',
  GameStage.openCards: 'openCards',
  GameStage.speaking: 'speaking',
  GameStage.voting: 'voting',
  GameStage.voteResult: 'voteResult',
  GameStage.preFinalLoading: 'preFinalLoading',
  GameStage.finals: 'finals',
};
