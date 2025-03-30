import 'package:flutter/material.dart';
import 'package:shelter_ai/domain/models/disaster.dart';

class LoreDialog extends StatelessWidget {
  final Disaster disaster;

  const LoreDialog({
    super.key,
    required this.disaster,
  });

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

              // Disaster description
              _buildSection(
                "Описание катастрофы",
                disaster.disasterDescription,
              ),
              const SizedBox(height: 16),

              // Shelter info
              _buildSection(
                "Убежище",
                "${disaster.shelterName} (${disaster.location})",
              ),
              const SizedBox(height: 8),
              _buildSection(
                "Описание убежища",
                disaster.description,
              ),
              const SizedBox(height: 8),
              _buildSection(
                "Вместимость",
                "${disaster.capacity} человек",
              ),
              const SizedBox(height: 16),

              // Rooms
              _buildSection(
                "Помещения",
                disaster.rooms.join(", "),
              ),
              const SizedBox(height: 16),

              // Resources
              _buildSection(
                "Ресурсы",
                disaster.resources.join(", "),
              ),
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
                  child: const Text("Закрыть"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B5642),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF5A503F),
          ),
        ),
      ],
    );
  }
}
