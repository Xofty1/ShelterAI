import 'package:shelter_ai/domain/models/game_settings.dart';

abstract class GameEvent{}

/// Событие инициализирует загрузку игры
class StartedGameEvent extends GameEvent{
  StartedGameEvent(this.settings);
  final GameSettings settings;
}

// Окончание раунда
// Можно начать новый/закончить игру
class RoundFinishedGameEvent extends GameEvent{}

// Окончание объявления информации по раунду
// Можно скрыть информацию о раунде и показать информацию о том,
// кто ходит
class RoundStartedGameEvent extends GameEvent{}

// Можно скрыть информацию о ходе игрока и начать ход
// ?Работает и для голосования?
class TurnStartedGameEvent extends GameEvent{}

// Была вскрыта какая-то характеристика
// Можно вскрывать следующую/запускать ход следующего игрока
// Или запускать голосование, если все игроки сходили
class OpeningTurnGameEvent extends GameEvent{
  OpeningTurnGameEvent(this.propertyIndex);
  final int propertyIndex;
}

// Голос отдан
// Можно отобразить, кто голосует следующим
// Или подвести итоги голосования
class VoteGivenGameEvent extends GameEvent{}


