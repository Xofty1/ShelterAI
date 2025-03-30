import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';

class ShelterHome extends StatelessWidget {
  const ShelterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainMenuScreen();
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6B5642), Color(0xFFD1A881)], // Цвета градиента
            begin: Alignment.topLeft, // Начало градиента
            end: Alignment.bottomRight, // Конец градиента
          ),
        ),
        child: Stack(
          children: [
            // const Image(
            //   //image: AssetImage('assets/images/door.png'),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'БУНКЕР',
                      style: TextStyle(
                        color: Color.fromRGBO(90, 80, 63, 1.0),
                        fontSize: 64,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 64),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        CustomButton(text: "Новая игра", onPressed: () {
                          Navigator.pushNamed(context, '/game_settings');
                        }),
                        const SizedBox(height: 16),
                        CustomButton(text: "История", onPressed: () {}),
                        const SizedBox(height: 16),
                        CustomButton(text: "Правила", onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 30,
              bottom: 30,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(
                  Icons.settings,
                  size: 60,
                  color: Color.fromRGBO(217, 217, 217, 1.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}