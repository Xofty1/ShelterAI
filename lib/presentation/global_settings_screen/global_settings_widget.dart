import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_template.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';

import '../../core/app_shared_preference/app_shared_preference.dart';
import '../../domain/bloc/app_settings_cubit.dart';
import '../ui_items/dropdown_spinner.dart';
import '../ui_items/label.dart';

class AppSettingsWidget extends StatelessWidget {
  const AppSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSettingsCubit(),
      child: const GlobalSettingsWidget(),
    );
  }
}

class GlobalSettingsWidget extends StatelessWidget {
  const GlobalSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const Map<String, String> languageMap = {
      'ru': 'Русский',
      'en': 'Английский',
    };
    String loc = AppSharedPreference().getString("language") ?? "en";
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) => ScaffoldTemplate(
        name: "Настройки",
        child: Column(
          children: [
            const Center(
              child: Text(
                "Громкость",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF6B4F35)),
              ),
            ),
            const SizedBox(height: 16),
            DropdownSpinner(
              items: languageMap.values.toList(),
              initialValue: languageMap[loc],
              itemLabel: (item) => item,
              onChanged: (value) {
                String languageName = value == 'Английский' ? 'en' : 'ru';
                AppSharedPreference().saveString("language", languageName);
                BlocProvider.of<AppSettingsCubit>(context)
                    .updateLocale(languageName);
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelWidget(text: "Музыка"),
                Expanded(
                  child: SliderSettings(
                    loadSetting: () =>
                        AppSharedPreference().getDouble("music") ?? 50.0,
                    saveSetting: (value) async =>
                        await AppSharedPreference().saveDouble("music", value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelWidget(text: "Озвучка"),
                Expanded(
                  child: SliderSettings(
                    loadSetting: () =>
                        AppSharedPreference().getDouble("dubbing") ?? 50.0,
                    saveSetting: (value) async => await AppSharedPreference()
                        .saveDouble("dubbing", value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelWidget(text: "Эффекты"),
                Expanded(
                  child: SliderSettings(
                    loadSetting: () =>
                        AppSharedPreference().getDouble("effects") ?? 50.0,
                    saveSetting: (value) async => await AppSharedPreference()
                        .saveDouble("effects", value),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
