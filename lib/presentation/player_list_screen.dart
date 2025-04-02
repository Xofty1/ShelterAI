import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';
import '../domain/models/player.dart';
import 'ui_items/player_tap_card.dart';

class PlayersListScreen extends StatelessWidget {

  final List<Player> players;

  const PlayersListScreen({
    super.key,
    required this.players
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildPlayerCards(players),
              ),
            ),
            AppButton(
                text: 'Вернуться',
                onPressed: () {Navigator.pop(context);}
            ),
          ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Cписок игроков',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerCards(List<Player> players) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      children: List.generate(players.length, (index) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlayerCard(
                number: (index + 1).toString(),
                name: players[index].name,
                profession: players[index].profession,
              ),
            ),
          ],
        );
      }),
    );
  }
}