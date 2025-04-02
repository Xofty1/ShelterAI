import 'package:shelter_ai/core/di/global_dep.dart';
import '../../domain/bloc/game_bloc.dart';

class GameDepHolder{
  GameDepContainer? _container;
  bool _isCreated = false;

  GameDepContainer? get container => _container;
  bool get isCreated => _isCreated;

  void create(GlobalDepContainer globalDepContainer){
    _container = GameDepContainer(globalDepContainer);
    _isCreated = true;
  }

  void dispose(){
    if(_container != null) {
      _container!.dispose();
      _container = null;
    }
    _isCreated = false;
  }
}

class GameDepContainer {
  final GameBloc gameBloc;

  void dispose(){
    gameBloc.close();
  }

  GameDepContainer(GlobalDepContainer container)
      : gameBloc = GameBloc(container.gptRepository);
}
