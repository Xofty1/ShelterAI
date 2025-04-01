import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/game_settings.dart';

class GameSettingsCubit extends Cubit<GameSettingsState>{
  GameSettingsCubit() : super(const GameSettingsState.initial());

  void updatePlayersCount(int newCount){
    emit(GameSettingsState(
        settings: state.settings.copyWith(
            playersCount: newCount
        )
    ));
  }

  void updateDifficulty(int newDifficulty){
    emit(GameSettingsState(
        settings: state.settings.copyWith(
            difficulty: newDifficulty
        )
    ));
  }

  void updatePlot(String value){
    emit(GameSettingsState(
        settings: state.settings.copyWith(
            plot: value
        )
    ));
  }

  void updateSafeMode(bool newMode){
    emit(GameSettingsState(
        settings: state.settings.copyWith(
            safeMode: newMode
        )
    ));
  }

  void updateLanguage(String language){
    emit(GameSettingsState(
        settings: state.settings.copyWith(
            language: language
        )
    ));
  }

  void updateTime(int newTime){
    emit(GameSettingsState(
        settings: state.settings.copyWith(
            time: newTime,
        )
    ));
  }

}

class GameSettingsState{
  const GameSettingsState({
    required this.settings
  });

  const GameSettingsState.initial() :
        settings = const GameSettings(
            playersCount: 5,
            difficulty: 2,
            plot: '',
            safeMode: false,
            language: '',
            time: 30,
        );

  final GameSettings settings;
}