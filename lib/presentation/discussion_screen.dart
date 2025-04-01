import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/presentation/widgets/custom_timer.dart';

import '../domain/bloc/game_bloc.dart';

class DiscussionScreen extends StatelessWidget {
  final int roundNumber;

  const DiscussionScreen({super.key, required this.roundNumber});

  @override
  Widget build(BuildContext context) {
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


              // Заголовок "Обсуждение"
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: const Color(0xFFD7CCC8), // Светло-бежевый
                child: const Text(
                  'Обсуждение',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3E2723), // Темно-коричневый
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Таймер
              CustomTimer(
                initialSeconds: 30,
                onComplete: () =>
                    BlocProvider.of<GameBloc>(context).add(ReadyGameEvent()),
              ),

              const Spacer(),

              // Нижние кнопки
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildButton('Игроки', onPressed: () {}),
                    const SizedBox(height: 12),
                    _buildButton(
                      'Голосование',
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
