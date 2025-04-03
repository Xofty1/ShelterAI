import 'package:flutter/material.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/presentation/ui_items/info_row.dart';

import '../../l10n/l10n.dart';

class SettingsDialog extends StatelessWidget {
  final GameSettings settings;

  const SettingsDialog({
    super.key,
    required this.settings,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
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
            children: [
              // Title
              const Text(
                "Настройки игры",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A503F),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Settings Info
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B7355),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    InfoRow(
                      label: "Количество игроков",
                      value: settings.playersCount.toString(),
                    ),
                    const SizedBox(height: 16),
                    InfoRow(
                      label: "Сложность",
                      value: settings.difficulty.toString(),
                    ),
                    const SizedBox(height: 16),
                    InfoRow(
                      label: "Время на обсуждение",
                      value: "${settings.time} с.",
                    ),
                    const SizedBox(height: 16),
                    InfoRow(
                      label: "Семейный режим",
                      value: settings.safeMode ? "Вкл" : "Выкл",
                    ),
                    if (settings.plot.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      InfoRow(
                        label: "Пожелания",
                        value: settings.plot,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Close button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B7355),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  "Закрыть",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
