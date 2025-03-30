import 'package:flutter/material.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/presentation/ui_items/label.dart';

class SettingsDialog extends StatefulWidget {
  final GameSettings settings;

  const SettingsDialog({
    super.key,
    required this.settings,
  });

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  late int playersCount;
  late int difficulty;
  late String plot;
  late bool safeMode;
  late int time;

  @override
  void initState() {
    super.initState();
    // Initialize with settings passed to the dialog
    playersCount = widget.settings.playersCount;
    difficulty = widget.settings.difficulty;
    plot = widget.settings.plot;
    safeMode = widget.settings.safeMode;
    time = widget.settings.time;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFD1A881),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Настройки игры",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5A503F),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Players count slider
              LabelWidget(text: "Количество: ${playersCount.toString()}"),
              const SizedBox(height: 20),
              LabelWidget(text: "Сложность: ${difficulty.toString()}"),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliderSection(
    String title,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ${value.round()}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B5642),
          ),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).round(),
          activeColor: const Color(0xFF8B7355),
          inactiveColor: const Color(0xFFD9D9D9),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDropdownSection(
    String title,
    String value,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B5642),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: Container(),
            dropdownColor: const Color(0xFFD9D9D9),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchSection(
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B5642),
          ),
        ),
        Switch(
          value: value,
          activeColor: const Color(0xFF8B7355),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
