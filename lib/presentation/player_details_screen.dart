import 'package:flutter/material.dart';
import 'package:shelter_ai/core/theme/app_colors.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/ui_items/front_card_side.dart';
import 'package:shelter_ai/presentation/vote_result_screen.dart';

class PlayerDetailsScreen extends StatelessWidget {
  final Player player;

  const PlayerDetailsScreen({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.mainGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: AppColors.textPrimary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        "ДЕТАЛИ ИГРОКА",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                        width: 40), // Для балансировки с кнопкой назад
                  ],
                ),
              ),
              PlayerCardDetail(
                player: player,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
