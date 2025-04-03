import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../models/disaster.dart';
import '../models/game_settings.dart';
import '../models/player.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  GptRepository repository;

  GameSettingsCubit(this.repository) : super(const GameSettingsState.initial());

  void updatePlayersCount(int newCount) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(playersCount: newCount)),
    );
  }

  void updateDifficulty(int newDifficulty) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(difficulty: newDifficulty)),
    );
  }

  void updatePlot(String value) {
    emit(
      GameSettingsState(settings: state.settings.copyWith(plot: value)),
    );
  }

  void updateSafeMode(bool newMode) {
    emit(
      GameSettingsState(settings: state.settings.copyWith(safeMode: newMode)),
    );
  }

  void updateTime(int newTime) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(
        time: newTime,
      )),
    );
  }

  Future<void> startGame(String language) async {
    emit(DisasterLoadingState(
      settings: state.settings.copyWith(language: language),
    ));

    try{
      print('we are in try');
      final Disaster disaster = await repository.createGame(state.settings);
      final List<Player> players = await repository.createPlayers(state.settings, disaster);

      emit(DisasterUploadedState(
        settings: state.settings,
        disaster: disaster,
        players: players,
      ));
    } catch(e){
      print(e);
      emit(ErrorLoadingGameState(settings: state.settings));
    }
  }

  void updateEnableTime(bool newEnable) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(
            isTimerEnable: newEnable,
          )),
    );
  }
}

class GameSettingsState {
  const GameSettingsState({required this.settings});

  const GameSettingsState.initial()
      : settings = const GameSettings(
          playersCount: 5,
          difficulty: 2,
          plot: '',
          safeMode: false,
          language: 'ru',
          time: 30,
          isTimerEnable: true,
        );

  final GameSettings settings;
}

class DisasterLoadingState extends GameSettingsState {
  DisasterLoadingState({required super.settings});
}

class ErrorLoadingGameState extends GameSettingsState{
  ErrorLoadingGameState({required super.settings});
}

class DisasterUploadedState extends GameSettingsState {
  final Disaster disaster;
  final List<Player> players;

  DisasterUploadedState({
    required super.settings,
    required this.disaster,
    required this.players,
  });
}
