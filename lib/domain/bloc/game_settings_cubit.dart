import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../models/disaster.dart';
import '../models/game_settings.dart';
import '../models/player.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  GPTRepository repository;

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

  Future<void> startGame() async {
    emit(DisasterLoadingState(
      settings: state.settings,
    ));

    final disaster = await repository.getDisaster(state.settings);
    final players = await repository.getPlayers(state.settings);

    emit(DisasterUploadedState(
      settings: state.settings,
      disaster: disaster,
      players: players,
    ));
  }

  void updateLanguage(String language) {
    emit(GameSettingsState(
        settings: state.settings.copyWith(language: language)));
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
          language: '',
          time: 30,
          isTimerEnable: true,
        );

  final GameSettings settings;
}

class DisasterLoadingState extends GameSettingsState {
  DisasterLoadingState({required super.settings});
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
