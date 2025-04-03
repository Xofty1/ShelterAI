import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';
import 'package:shelter_ai/presentation/ui_items/player_tap_card.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Text(
                'ОЖИДАНИЕ ИГРОКОВ',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PlayerTapCard(
                        player: player,
                      ),
                    );
                  },
                ),
              ),
            ),
            if (isHost)
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: AppButton(
                  text: 'Начать игру',
                  onPressed: onStartGame,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
