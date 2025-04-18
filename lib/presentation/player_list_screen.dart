import 'package:flutter/material.dart';
import 'package:shelter_ai/core/theme/app_colors.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import '../domain/models/player.dart';
import 'ui_items/player_tap_card.dart';
import 'player_details_screen.dart';
import '../../l10n/l10n.dart';

class PlayersListScreen extends StatelessWidget {
  final List<Player> players;

  const PlayersListScreen({super.key, required this.players});

  void _showPlayerDetails(BuildContext context, Player player, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayerDetailsScreen(
          player: player,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.mainGradient,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
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
              child: Text(
                loc.playerList,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              children: List.generate(players.length, (index) {
                return GestureDetector(
                  onTap: () =>
                      _showPlayerDetails(context, players[index], index),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlayerTapCard(
                      player: players[index],
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: loc.returnWord,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
