import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';

import 'disaster.dart';
import 'game_settings.dart';

part 'game_state.freezed.dart';

@freezed
abstract class GameState with _$GameState{
  const factory GameState({
    // Настройки игры
    required GameSettings settings,
    // Свойства катастрофы
    required Disaster disaster,
    // Список игроков
    required List<Player> players,
    // Текущая стадия игры
    required GameStage stage,
    // Вся информация по текущему раунду
    required RoundInfo roundInfo,
    // Количество действий, сделынных игроком на данном ходу (кол-во открытых карточек)
    required int actionsTaken,
    // Индекс текущего игрока (чей ход)
    required int currentPlayerIndex,
  }) = _GameState;
}

/// Список этапов игры
enum GameStage{
  /// Этап представления игрокам истории
  intro,
  /// Этап объявления раунда
  roundStarted,
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