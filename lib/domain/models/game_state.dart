import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/models/vote_info.dart';

import 'disaster.dart';
import 'game_settings.dart';

part 'game_state.freezed.dart';

abstract class GameState {
  const GameState();
}

// TODO: Загрузка для финала
// class LoadingGameState extends GameState{
//   const LoadingGameState();
// }

@freezed
abstract class RunningGameState extends GameState with _$RunningGameState {
  const RunningGameState._();

  const factory RunningGameState({
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
    // Информация о голосовании
    required VoteInfo voteInfo,
    // Индекс текущего игрока (чей ход)
    required int currentPlayerIndex,
  }) = _GameState;

  factory RunningGameState.initial(
          {required GameSettings settings,
          required Disaster disaster,
          required List<Player> players}) =>
      RunningGameState(
          settings: settings,
          disaster: disaster,
          players: players,
          stage: GameStage.intro,
          roundInfo: getRoundInfo(1, players.length),
          voteInfo: VoteInfo(
            votes: List.filled(players.length, 0),
            canBeSelected: List.filled(players.length, true),
            selectedIndexes: [],
            voteStatus: VoteStatus.none,
          ),
          currentPlayerIndex: 0);
}

/// Список этапов игры
enum GameStage {
  /// Этап представления игрокам истории
  intro,

  /// Этап объявления раунда
  roundStarted,

  /// Этап вскрытия данных
  openCards,

  /// Этап обсуждения
  speaking,

  /// Этап голосования
  voting,

  /// Этап объявления результатов голосования
  voteResult,

  /// Финальный этап
  finals,
}
