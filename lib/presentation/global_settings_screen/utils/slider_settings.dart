import 'package:flutter/material.dart';

class SliderSettings extends StatefulWidget {
  final double Function() loadSetting;
  final Future<void> Function(double value) saveSetting;
  final double min;
  final double max;
  final double defaultValue;

  const SliderSettings({
    super.key,
    required this.loadSetting,
    required this.saveSetting,
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
    _sliderValue = widget.loadSetting();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 25,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
        activeTrackColor: Color(0xFFEAA25A),
        inactiveTrackColor: Colors.white,
        thumbColor: Color.fromRGBO(107, 86, 66, 80),
      ),
      child: Slider(
        value: _sliderValue,
        min: widget.min,
        max: widget.max,
        divisions: (widget.max - widget.min).toInt(),
        label: _sliderValue.toStringAsFixed(1),
        onChanged: (double value) {
          setState(() {
            _sliderValue = value;
          });
          widget.saveSetting(_sliderValue);
        },
      ),
    );
  }
}
