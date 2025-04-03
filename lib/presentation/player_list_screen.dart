import 'package:flutter/material.dart';
import 'package:shelter_ai/core/theme/app_colors.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/players_list.dart';
import '../domain/models/player.dart';

class PlayersListScreen extends StatelessWidget {
  final List<Player> players;

  const PlayersListScreen({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.mainGradient,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.accent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                "СПИСОК ИГРОКОВ",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: PlayerList(players: players),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: 'Вернуться',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
