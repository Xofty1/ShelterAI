import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_shared_preference/app_shared_preference.dart';
import '../models/app_settings.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsState.initial());

  void updateVolume(int dubbing) {
    emit(AppSettingsState(settings: state.settings.copyWith(dubbing: dubbing)));
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
    String language = AppSharedPreference().getLanguage() ?? "ru";
    return AppSettingsState(
      settings: AppSettings(
        dubbing: AppSharedPreference().getDubbing() ?? 50,
        music: AppSharedPreference().getMusic() ?? 50,
        effects: AppSharedPreference().getEffects() ?? 50,
        loc: language,
      ),
    );
  }

  const AppSettingsState({required this.settings});
}
