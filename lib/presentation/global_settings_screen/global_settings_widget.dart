import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';
import 'package:shelter_ai/presentation/ui_items/switch_settings.dart';

import '../../core/app_shared_preference/app_shared_preference.dart';
import '../ui_items/label.dart';

class GlobalSettingsWidget extends StatelessWidget {
  const GlobalSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8B6F55),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD3C0AA),
        title: Center(
          child: Text(
            "Настройки",
            style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFD3C0AA),
              borderRadius: BorderRadius.circular(10),
            ),
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
                    const SizedBox(
                      width: 80,
                      child: Text("Музыка"),
                    ),
                    Expanded(
                      child: SliderSettings(
                        loadSetting: () =>
                            AppSharedPreference().getDouble("music") ?? 50.0,
                        saveSetting: (value) async =>
                            await AppSharedPreference()
                                .saveDouble("music", value),
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
                            await AppSharedPreference()
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
                        saveSetting: (value) async =>
                            await AppSharedPreference()
                                .saveDouble("effects", value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text("ДА?"),
                    ),
                    Expanded(
                      child: SwitchSettings(
                        loadSetting: () =>
                        AppSharedPreference().getBool("yes") ?? false,
                        saveSetting: (value) async =>
                        await AppSharedPreference()
                            .saveBool("yes", value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text("ДА?"),
                    ),
                    Expanded(
                      child: CustomButton(
                        text: "fff",
                        onPressed: () {}
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
