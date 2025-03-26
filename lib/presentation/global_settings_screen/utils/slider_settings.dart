import 'package:flutter/material.dart';
import 'package:shelter_ai/core/app_shared_preference/app_shared_preference.dart';

class SliderSettings extends StatefulWidget {
  final String settingKey;
  final double min;
  final double max;
  final double defaultValue;

  const SliderSettings({
    super.key,
    required this.settingKey,
    this.min = 0.0,
    this.max = 100.0,
    this.defaultValue = 50.0,
  });

  @override
  State<SliderSettings> createState() => _SliderSettingsState();
}

class _SliderSettingsState extends State<SliderSettings> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _loadSetting();
  }

  void _loadSetting() {
    // Получаем значение как double или используем defaultValue
    _sliderValue = AppSharedPreference().getDouble(widget.settingKey) ?? widget.defaultValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _sliderValue,
      min: widget.min,
      max: widget.max,
      divisions: (widget.max - widget.min).toInt(), // Более гибкое количество делений
      label: _sliderValue.toStringAsFixed(1), // Форматирование с одним десятичным знаком
      onChanged: (double value) {
        setState(() {
          _sliderValue = value;
        });
        AppSharedPreference().saveDouble(widget.settingKey, _sliderValue);
      },
    );
  }
}