import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/bloc/game_bloc.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/player_details_screen.dart';
import 'package:shelter_ai/presentation/player_list_screen.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/players_list.dart';

class VoteResultScreen extends StatelessWidget {
  final List<Player> kickedPlayers;

  const VoteResultScreen({
    super.key,
    required this.kickedPlayers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6B5642), Color(0xFFD1A881)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Выгнанные игроки",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF482020),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(child: PlayerList(players: kickedPlayers)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomButton(
              text: "Продолжить",
              onPressed: () {
                BlocProvider.of<GameBloc>(context).add(ReadyGameEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerCardDetail extends StatelessWidget {
  final Player player;

  const PlayerCardDetail({
    super.key,
    required this.player
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color(0xFF6B5642),
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFF6B5642),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  player.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B5642),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  player.profession,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B5642),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoSection("Возраст", player.bio, player.knownProperties[0]),
          const SizedBox(height: 16),
          _buildInfoSection("Здоровье", player.health, player.knownProperties[1]),
          const SizedBox(height: 16),
          _buildInfoSection("Хобби/Навыки", player.hobby, player.knownProperties[2]),
          const SizedBox(height: 16),
          _buildInfoSection("Фобии", player.phobia, player.knownProperties[3]),
          const SizedBox(height: 16),
          _buildInfoSection("Багаж", player.luggage, player.knownProperties[4]),
          const SizedBox(height: 16),
          _buildInfoSection(
              "Дополнительная информация"
              , player.extra, player.knownProperties[5]),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, String content, bool isKnown) {
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
        const SizedBox(height: 8),
        Text(
          isKnown ? content : "Неизвестно",
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF482020),
          ),
        ),
      ],
    );
  }
}
