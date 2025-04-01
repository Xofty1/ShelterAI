import 'package:flutter/material.dart';

class SliderSettings extends StatefulWidget {
  final void Function(double) onChange;
  final double min;
  final double max;
  final double defaultValue;
  final bool isMuted;

  const SliderSettings({
    super.key,
    this.min = 0.0,
    this.max = 100.0,
    this.defaultValue = 50.0,
    this.isMuted = false,
    required this.onChange,
  });

  @override
  State<SliderSettings> createState() => _SliderSettingsState();
}

class _SliderSettingsState extends State<SliderSettings> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _sliderValue,
      min: widget.min,
      max: widget.max,
      divisions: (widget.max - widget.min).toInt(),
      label: _sliderValue.toStringAsFixed(0),
      onChanged: widget.isMuted
          ? null
          : (double value) {
              setState(() {
                _sliderValue = value;
              });
              widget.onChange(value);
            },
    );
  }
}
