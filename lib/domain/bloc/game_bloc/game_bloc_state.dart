import '../../models/game_state.dart';

abstract class GameBlocState{}

class GameLoadingState extends GameBlocState{}

class GameRunningState extends GameBlocState{
  GameRunningState({
    required this.gameState,
  });
  final GameState gameState;
}