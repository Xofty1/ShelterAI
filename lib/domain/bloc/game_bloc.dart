import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameBlocState>{
  GameBloc(GameState initialState):super(GameBlocState(state: initialState));

}


abstract class GameEvent{}

class GameStartedListening extends GameEvent{}
class GameRoundInformationFinished extends GameEvent{}

// Обертка на всякий случай, еще ни разу не мешала.
class GameBlocState{
  GameBlocState({
    required this.state,
  });
  final GameState state;
}