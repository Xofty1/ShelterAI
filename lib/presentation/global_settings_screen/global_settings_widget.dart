import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_template.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';

import '../../core/app_shared_preference/app_shared_preference.dart';
import '../../domain/bloc/app_settings_cubit.dart';
import '../../l10n/l10n.dart';
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
    final loc = AppLocalizations.of(context);
    const Map<String, String> languageMap = {
      'ru': 'Русский',
      'en': 'English',
    };
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) => ScaffoldTemplate(
        name: loc.settings,
        child: Column(
          children: [
            Center(
              child: Text(
                loc.language,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B4F35)),
              ),
            ),
            const SizedBox(height: 16),
            DropdownSpinner(
              items: languageMap.values.toList(),
              initialValue: languageMap[state.settings.loc],
              itemLabel: (item) => item,
              onChanged: (value) {
                String languageName = value == 'English' ? 'en' : 'ru';
                AppSharedPreference().saveLanguage(languageName);
                BlocProvider.of<AppSettingsCubit>(context)
                    .updateLocale(languageName);
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                loc.volume,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B4F35)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicWidth(
                  child: LabelWidget(text: loc.music),
                ),
                Expanded(
                  child: SliderSettings(
                    defaultValue: state.settings.music.toDouble(),
                    onChange: (value) {
                      BlocProvider.of<AppSettingsCubit>(context)
                          .updateMusic(value.toInt());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicWidth(
                  child: LabelWidget(text: loc.dubbing),
                ),
                Expanded(
                  child: SliderSettings(
                    defaultValue: AppSharedPreference().getDubbing()?.toDouble() ?? 50,
                    onChange: (value) {
                      AppSharedPreference().saveDubbing(value.toInt());
                      BlocProvider.of<AppSettingsCubit>(context)
                          .updateDubbing(value.toInt());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicWidth(
                  child: LabelWidget(text: loc.effects),
                ),

                Expanded(
                  child: SliderSettings(
                    defaultValue: AppSharedPreference().getEffects()?.toDouble() ?? 50,
                    onChange: (value) {
                      AppSharedPreference().saveEffects(value.toInt());
                      BlocProvider.of<AppSettingsCubit>(context)
                          .updateEffects(value.toInt());
                    },
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
