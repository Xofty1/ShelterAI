import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';
import 'ui_items/player_card_tap.dart';

class PlayersListScreen extends StatelessWidget {
  const PlayersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7C6854),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildPlayerCards(),
              ),
            ),
            AppButton(text: 'ГОЛОСОВАНИЕ', onPressed: () {
              Navigator.pushNamed(context, '/game_voting');
            })
          ],
        ),
      ),
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

  Widget _buildPlayerCards() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      childAspectRatio: 0.65,
      children: const [
        PlayerCard(number: '11', name: 'Олег', profession: 'Рабочий',),
        PlayerCard(number: '12', name: 'Игнат', profession: 'Мурлок',),
        PlayerCard(number: '23', name: 'Всевол', profession: 'Агент по недвижимости',),
        PlayerCard(number: '4', name: 'Гена', profession: 'Садовник',)
      ],
    );
  }
} 