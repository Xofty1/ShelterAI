import 'package:flutter/material.dart';

class SwitchSettings extends StatefulWidget {
  final bool Function() loadSetting;
  final Future<void> Function(bool value) saveSetting;

  const SwitchSettings(
      {super.key, required this.loadSetting, required this.saveSetting});

  @override
  State<SwitchSettings> createState() => _SwitchSettingsState();
}

class _SwitchSettingsState extends State<SwitchSettings> {
  bool curSettingValue = true;

  @override
  void initState() {
    super.initState();
    _loadSetting();
  }

  void _loadSetting() {
    bool value = widget.loadSetting();
    curSettingValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: curSettingValue,
      onChanged: (bool value) {
        setState(() {
          curSettingValue = value;
        });
        widget.saveSetting(curSettingValue);
      },
    );
  }
}
