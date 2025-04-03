import 'package:flutter/material.dart';
import 'package:shelter_ai/core/theme/app_colors.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/presentation/ui_items/info_row.dart';

import '../ui_items/label.dart';
import '../ui_items/state_section.dart';
import '../../l10n/l10n.dart';

class RoundInfoDialog extends StatelessWidget {
  final RoundInfo roundInfo;

  const RoundInfoDialog({
    super.key,
    required this.roundInfo,
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
              Text(
                loc.roundInfo,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A503F),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Round Info
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
                      label: loc.roundNumber,
                      value: roundInfo.roundNumber.toString(),
                    ),
                    const SizedBox(height: 16),
                    InfoRow(
                      label: loc.abilitiesToOpen,
                      value: roundInfo.openCount.toString(),
                    ),
                    const SizedBox(height: 16),
                    InfoRow(
                      label: loc.howManyToKick,
                      value: roundInfo.kickedCount.toString(),
                    ),
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
                child: Text(
                  loc.close,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
