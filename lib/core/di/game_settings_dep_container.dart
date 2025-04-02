import '../../domain/bloc/game_settings_cubit.dart';
import 'global_dep_container.dart';

class GameSettingsDepContainer {
  final GameSettingsCubit gameSettingsCubit;

  void dispose(){
    gameSettingsCubit.close();
  }

  GameSettingsDepContainer(GlobalDepContainer container)
      : gameSettingsCubit = GameSettingsCubit(container.gptRepository);
}
