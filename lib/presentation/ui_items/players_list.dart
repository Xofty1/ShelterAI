import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/player_tap_card.dart';

import '../../domain/models/player.dart';
import '../player_details_screen.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players;
  const PlayerList({super.key, required this.players});

  void _showPlayerDetails(BuildContext context, Player player) {
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
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      children: List.generate(
        players.length,
        (index) {
          return GestureDetector(
            onTap: () => _showPlayerDetails(context, players[index]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlayerTapCard(
                player: players[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
