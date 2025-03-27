import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/global_settings_screen/utils/slider_settings.dart';
import 'package:shelter_ai/presentation/global_settings_screen/utils/switch_settings.dart';

import '../../core/app_shared_preference/app_shared_preference.dart';

class GlobalSettingsWidget extends StatelessWidget {
  const GlobalSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8B6F55),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD3C0AA),
        title: const Center(
          child: Text("Настройки"),
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
                    const SizedBox(
                      width: 80,
                      child: Text("Озвучка"),
                    ),
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
                    const SizedBox(
                      width: 80,
                      child: Text("Эффекты"),
                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
