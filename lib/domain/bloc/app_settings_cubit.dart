import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_shared_preference/app_shared_preference.dart';
import '../models/app_settings.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsState.initial());

  void updateVolume(int volume) {
    emit(AppSettingsState(settings: state.settings.copyWith(volume: volume)));
  }

  void updateMusic(int music) {
    emit(AppSettingsState(settings: state.settings.copyWith(music: music)));
  }

  void updateEffects(int effects) {
    emit(AppSettingsState(settings: state.settings.copyWith(effects: effects)));
  }

  void updateLocale(String language) {
    emit(AppSettingsState(
        settings: state.settings.copyWith(loc: language)));
  }
}

class AppSettingsState {
  final AppSettings settings;

  factory AppSettingsState.initial() {
    String language = AppSharedPreference().getString('language') ?? "ru";
    return AppSettingsState(
      settings: AppSettings(
        volume: (AppSharedPreference().getDouble('volume') ?? 50).toInt(),
        music: (AppSharedPreference().getDouble('music') ?? 50).toInt(),
        effects: (AppSharedPreference().getDouble('effects') ?? 50).toInt(),
        loc: language,
      ),
    );
  }

  const AppSettingsState({required this.settings});
}
