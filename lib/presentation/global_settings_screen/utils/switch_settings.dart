import 'package:flutter/material.dart';

import '../../../core/app_shared_preference/app_shared_preference.dart';

class SwitchSettings extends StatefulWidget {
  final String settingKey;

  const SwitchSettings({super.key, required this.settingKey});

  @override
  State<SwitchSettings> createState() => _SwitchSettingsState();
}

class _SwitchSettingsState extends State<SwitchSettings> {
  bool curSettingValue = true; // Значение по умолчанию

  @override
  void initState() {
    super.initState();
    _loadSetting(); // Загружаем данные при старте
  }

  /// Загружаем настройки
  void _loadSetting()  {
    bool value = AppSharedPreference().getBool(widget.settingKey) ?? false;
    setState(() {
      curSettingValue = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: curSettingValue,
      activeColor: Colors.red,
      onChanged: (bool value) {
        setState(() {
          curSettingValue = value;
        });
        AppSharedPreference().saveBool(widget.settingKey, curSettingValue);
      },
    );
  }
}
