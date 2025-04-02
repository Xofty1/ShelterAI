import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/bloc/game_bloc.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';

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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: kickedPlayers.length,
              itemBuilder: (context, index) {
                final player = kickedPlayers[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Hero(
                    tag: 'player_card_${player.name}',
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayerCardDetailScreen(
                                player: player,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B7355),
                            borderRadius: BorderRadius.circular(12),
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
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: const Color(0xFF6B5642),
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Color(0xFF6B5642),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Игрок ${player.name}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFD9D9D9),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Нажмите, чтобы увидеть карту игрока",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: const Color(0xFFD9D9D9)
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFFD9D9D9),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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

class PlayerCardDetailScreen extends StatelessWidget {
  final Player player;

  const PlayerCardDetailScreen({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6B5642),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B7355),
        title: Text(
          "Карта игрока ${player.name}",
          style: const TextStyle(
            color: Color(0xFFD9D9D9),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD9D9D9)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Hero(
        tag: 'player_card_${player.name}',
        child: Container(
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
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
                ),
                const SizedBox(height: 24),
                _buildInfoSection("Возраст", player.bio),
                const SizedBox(height: 16),
                _buildInfoSection("Здоровье", player.health),
                const SizedBox(height: 16),
                _buildInfoSection("Хобби/Навыки", player.hobby),
                const SizedBox(height: 16),
                _buildInfoSection("Фобии", player.phobia),
                const SizedBox(height: 16),
                _buildInfoSection("Багаж", player.luggage),
                const SizedBox(height: 16),
                _buildInfoSection("Дополнительная информация", player.extra),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
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
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF482020),
          ),
        ),
      ],
    );
  }
}
