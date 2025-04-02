import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_shared_preference/app_shared_preference.dart';
import '../models/app_settings.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsState.initial());

  void loadFromSharedPreferences(){
    emit(AppSettingsState(
      settings: AppSettings(
        dubbing: AppSharedPreference().getDubbing() ?? 50,
        music: AppSharedPreference().getMusic() ?? 50,
        effects: AppSharedPreference().getEffects() ?? 50,
        loc: AppSharedPreference().getLanguage() ?? "ru",
      ),
    ));
  }

  void updateDubbing(int dubbing) {
    AppSharedPreference().saveDubbing(dubbing);
    emit(AppSettingsState(settings: state.settings.copyWith(dubbing: dubbing)));
  }

  void updateMusic(int music) {
    AppSharedPreference().saveMusic(music);
    emit(AppSettingsState(settings: state.settings.copyWith(music: music)));
  }

  void updateEffects(int effects) {
    AppSharedPreference().saveEffects(effects);
    emit(AppSettingsState(settings: state.settings.copyWith(effects: effects)));
  }

  Future<void> updateLocale(String language) async {
    await AppSharedPreference().saveLanguage(language);
    print("52 ${language}");
    emit(AppSettingsState(settings: state.settings.copyWith(loc: language)));
    print("53 ${state.settings.loc}");
  }
}

class AppSettingsState {
  final AppSettings settings;

  factory AppSettingsState.initial() {
    return AppSettingsState(
      settings: AppSettings(
        dubbing: AppSharedPreference().getDubbing() ?? 50,
        music: AppSharedPreference().getMusic() ?? 50,
        effects: AppSharedPreference().getEffects() ?? 50,
        loc: AppSharedPreference().getLanguage() ?? "ru",
      ),
    );
  }

  const AppSettingsState({required this.settings});
}
