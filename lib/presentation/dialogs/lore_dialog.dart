import 'package:flutter/material.dart';
import 'package:shelter_ai/domain/models/disaster.dart';

import '../ui_items/state_section.dart';
import '../../l10n/l10n.dart';

class LoreDialog extends StatelessWidget {
  final Disaster disaster;

  const LoreDialog({
    super.key,
    required this.disaster,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Center(
                child: Text(
                  disaster.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5A503F),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              StateSection(
                  title: loc.disasterDescription,
                  content: disaster.disasterDescription),

              const SizedBox(height: 16),
              StateSection(
                  title: loc.shelter,
                  content: "${disaster.shelterName} (${disaster.location})"),

              const SizedBox(height: 8),
              StateSection(
                  title: loc.shelterDescription, content: disaster.description),

              const SizedBox(height: 8),
              StateSection(
                  title: loc.capacity,
                  content: "${disaster.capacity} ${loc.humans}"),

              const SizedBox(height: 16),

              StateSection(
                  title: loc.rooms, content: disaster.rooms.join(", ")),

              const SizedBox(height: 16),
              StateSection(
                  title: loc.resources, content: disaster.resources.join(", ")),
              const SizedBox(height: 20),

              // Close button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B7355),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(loc.close),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
