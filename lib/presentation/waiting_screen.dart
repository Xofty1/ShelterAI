import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';
import 'package:shelter_ai/presentation/ui_items/player_card.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_template.dart';

import '../domain/models/player.dart';

class WaitingScreen extends StatelessWidget {
  final List<Player> players;
  final VoidCallback onStartGame;
  final bool isHost;

  const WaitingScreen({
    Key? key,
    required this.players,
    required this.onStartGame,
    required this.isHost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      name: 'Ожидание игроков',
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: PlayerCard(
                    number: '${index + 1}',
                    name: player.name,
                    profession: "",
                  ),
                );
              },
            ),
          ),
          if (isHost)
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppButton(
                text: 'Начать игру',
                onPressed: onStartGame,
              ),
            ),
        ],
      ),
    );
  }
}
