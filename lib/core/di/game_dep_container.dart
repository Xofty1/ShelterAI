import 'package:shelter_ai/core/di/global_dep_container.dart';
import '../../domain/bloc/game_bloc.dart';

class GameDepContainer {
  final GameBloc gameBloc;

  void dispose(){
    gameBloc.close();
  }

  GameDepContainer(GlobalDepContainer container)
      : gameBloc = GameBloc(container.gptRepository);
}
