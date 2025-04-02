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

    final map = await repository.createGame(state.settings);
    final Disaster disaster = map['disaster'] as Disaster;
    final players = map['player_list'] as List<Player>;

    emit(DisasterUploadedState(
      settings: state.settings,
      disaster: disaster,
      players: players,
    ));
  }

  void updateIsOnline(bool newIsOnline) {
    emit(
      GameSettingsState(
          settings: state.settings.copyWith(
            isOnline: newIsOnline,
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
          isOnline: false,
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
