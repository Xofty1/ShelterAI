import 'package:flutter/material.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';

import 'package:shelter_ai/presentation/ui_items/state_card_row.dart';


class PlayerCardFront extends StatelessWidget {
  final Player player;
  final int openCount;
  final List<int> selectedIndexes;
  final Function(int, bool) onToggle;
  final VoidCallback onConfirm;

  const PlayerCardFront({
    super.key,
    required this.player,
    required this.openCount,
    required this.selectedIndexes,
    required this.onToggle,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xFF6B5642), width: 2),
              ),
              child: const Icon(
                Icons.person,
                size: 70,
                color: Color(0xFF6B5642),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              player.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A503F),
              ),
            ),
          ),
          const SizedBox(height: 12),
          StateCardRow(
              label: "Возраст",
              assetsPath: "assets/images/age.svg",
              initialActive: player.knownProperties[0],
              isWorked: selectedIndexes.length < openCount,
              content: player.bio,
              onToggle: (value) {
                onToggle(0, value);
              }),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Здоровье",
            assetsPath: "assets/images/health.svg",
            initialActive: player.knownProperties[1],
            isWorked: selectedIndexes.length < openCount,
            content: player.health,
            onToggle: (value) {
              onToggle(1, value);
            },
          ),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Хобби/Навыки",
            assetsPath: "assets/images/hobby.svg",
            initialActive: player.knownProperties[2],
            isWorked: selectedIndexes.length < openCount,
            content: player.hobby,
            onToggle: (value) {
              onToggle(2, value);
            },
          ),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Фобии",
            assetsPath: "assets/images/phobia.svg",
            initialActive: player.knownProperties[3],
            isWorked: selectedIndexes.length < openCount,
            content: player.phobia,
            onToggle: (value) {
              onToggle(3, value);
            },
          ),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Багаж",
            assetsPath: "assets/images/luggage.svg",
            initialActive: player.knownProperties[4],
            isWorked: selectedIndexes.length < openCount,
            content: player.luggage,
            onToggle: (value) {
              onToggle(4, value);
            },
          ),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Дополнительная информация",
            assetsPath: "assets/images/extra.svg",
            initialActive: player.knownProperties[5],
            isWorked: selectedIndexes.length < openCount,
            content: player.extra,
            onToggle: (value) {
              onToggle(5, value);
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: Opacity(
              opacity: selectedIndexes.length != openCount ? 0.6 : 1.0,
              child: IgnorePointer(
                ignoring: selectedIndexes.length != openCount,
                child: CustomButton(
                  text: "Подтверить",
                  onPressed: onConfirm,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}