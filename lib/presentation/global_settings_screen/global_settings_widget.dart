import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/global_settings_screen/utils/slider_settings.dart';
import 'package:shelter_ai/presentation/global_settings_screen/utils/switch_settings.dart';

class GlobalSettingsWidget extends StatelessWidget {
  const GlobalSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Настройки"),
        ),
        body: const Column(
          children: [
            Row(
              children: [
                Text("Озвучка"),
                SwitchSettings(settingKey: "sound", ),
              ],
            ),
            Row(
              children: [
                Text("Тема"),
                SwitchSettings(settingKey: "theme", ),
              ],
            ),
            Row(
              children: [
                Text("Громкость"),
                SliderSettings(settingKey: "volume",)
              ],
            ),
          ],
        ));
  }
}

