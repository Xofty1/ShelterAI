import '../../domain/bloc/game_settings_cubit.dart';
import 'global_dep.dart';

class GameSettingsDepHolder{
  GameSettingsDepContainer? _container;
  bool _isCreated = false;

  GameSettingsDepContainer? get container => _container;
  bool get isCreated => _isCreated;

  void create(GlobalDepContainer globalDepContainer){
    _container = GameSettingsDepContainer(globalDepContainer);
    _isCreated = true;
  }

  void dispose(){
    if(_container != null) _container!.dispose();
    _isCreated = false;
  }
}

class GameSettingsDepContainer {
  final GameSettingsCubit gameSettingsCubit;

  void dispose(){
    gameSettingsCubit.close();
  }

  GameSettingsDepContainer(GlobalDepContainer container)
      : gameSettingsCubit = GameSettingsCubit(container.gptRepository, container.firebaseRepository);
}
