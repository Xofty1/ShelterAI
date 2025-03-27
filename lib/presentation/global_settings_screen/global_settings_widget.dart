import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_template.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';

import '../../core/app_shared_preference/app_shared_preference.dart';
import '../ui_items/label.dart';

class GlobalSettingsWidget extends StatelessWidget {
  const GlobalSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      name: "Настройки",
      child: Column(
        children: [
          const Center(
            child: Text(
              "Громкость",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LabelWidget(text: "Озвучка"),
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
                  saveSetting: (value) async =>
                      await AppSharedPreference().saveDouble("dubbing", value),
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
                  saveSetting: (value) async =>
                      await AppSharedPreference().saveDouble("effects", value),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
