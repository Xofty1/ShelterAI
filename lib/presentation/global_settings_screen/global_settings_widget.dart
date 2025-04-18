import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_template.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';

import '../../domain/bloc/app_settings_cubit.dart';
import '../../l10n/l10n.dart';
import '../ui_items/dropdown_spinner.dart';
import '../ui_items/label.dart';

class AppSettingsWidget extends StatelessWidget {
  const AppSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalSettingsWidget();
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
            // Music row with 1:3 ratio
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IntrinsicWidth(
                    child: LabelWidget(text: loc.music),
                  ),
                ),
                const SizedBox(width: 16), // Добавляем отступ между элементами
                Expanded(
                  flex: 2,
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
            // Dubbing row with 1:3 ratio
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IntrinsicWidth(
                    child: LabelWidget(text: loc.dubbing),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: SliderSettings(
                    defaultValue: state.settings.dubbing.toDouble(),
                    onChange: (value) {
                      BlocProvider.of<AppSettingsCubit>(context)
                          .updateDubbing(value.toInt());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Effects row with 1:3 ratio
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IntrinsicWidth(
                    child: LabelWidget(text: loc.effects),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: SliderSettings(
                    defaultValue: state.settings.effects.toDouble(),
                    onChange: (value) {
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
