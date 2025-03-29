import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shelter_ai/domain/models/player.dart';

import 'disaster.dart';
import 'game_settings.dart';

part 'game_state.freezed.dart';

@freezed
abstract class GameState with _$GameState{
  const factory GameState({
    required GameSettings settings,
    required Disaster disaster,
    required GameStage stage,
    required int iteration,
    required List<Player> players,
    required List<List<String>> notes,
  }) = _GameState;
}

/// Список этапов игры
enum GameStage{
  /// Этап представления игрокам истории
  storytelling,
  /// Этап объявления раунда
  roundInfo,
  /// Этап вскрытия данных
  openCards,
  /// Этаб обсуждения
  speaking,
  /// Этап голосования
  voting,
  /// Этап дообсуждения
  reSpeaking,
  /// Этап переголосования
  reVoting,
  /// Этап объявления результатов голосования
  voteResult,
  /// Финальный этап
  finals,
}