import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/presentation/player_list_screen.dart';
import 'package:shelter_ai/presentation/ui_items/custom_timer.dart';

import '../domain/bloc/game_bloc.dart';
import '../domain/models/game_state.dart';
import '../domain/models/player.dart';
import '../../l10n/l10n.dart';

class DiscussionScreen extends StatelessWidget {
  final int roundNumber;
  final int seconds;
  final List<Player> players;

  const DiscussionScreen(
      {super.key,
      required this.roundNumber,
      required this.seconds,
      required this.players});

  void _showPlayersScreen(BuildContext context, List<Player> players) {
    showDialog(
      context: context,
      builder: (BuildContext context) => PlayersListScreen(players: players),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    const headerColor = Color(0xFFB8A876);
    const headerTextColor = Color(0xFF482020);
    const votingPlayerHeaderColor = Color(0xFF604D4D);
    const voteHeaderColor = Color(0xFFAB9A7F);
    const buttonColor = Color(0xFF99582A);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6B5642), Color(0xFFD1A881)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: const Color(0xFFD7CCC8), // Светло-бежевый
                child: Text(
                  loc.discussion,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3E2723), // Темно-коричневый
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Таймер
              CustomTimer(
                initialSeconds: seconds,
                onComplete: () =>
                    BlocProvider.of<GameBloc>(context).add(ReadyGameEvent()),
              ),

              const Spacer(),

              // Нижние кнопки
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildButton(loc.players, onPressed: () {
                      _showPlayersScreen(context, players);
                    }),
                    const SizedBox(height: 12),
                    _buildButton(
                      loc.voting,
                      onPressed: () => BlocProvider.of<GameBloc>(context)
                          .add(ReadyGameEvent()),
                      color: buttonColor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    String text, {
    required VoidCallback onPressed,
    Color? color,
    Color? textColor,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? const Color(0xFFD7CCC8),
          foregroundColor: textColor ?? const Color(0xFF3E2723),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
