import 'package:flutter/material.dart';

class ShelterHome extends StatelessWidget {
  const ShelterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Бункер',
      theme: ThemeData(
        fontFamily: 'Jost',
        primarySwatch: Colors.grey,
      ),
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(107, 86, 66, 1.0),
      body: Stack(
        children: [ Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'БУНКЕР',
                  style: TextStyle(
                    color:  Color.fromRGBO(90, 80, 63, 1.0),
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.0,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              const SizedBox(
                width: 260,
                child: Column(
                  children: [
                    _MenuButton(text: 'Новая игра'),
                    SizedBox(height: 16),
                    _MenuButton(text: 'История'),
                    SizedBox(height: 16),
                    _MenuButton(text: 'Правила'),
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
                  onPressed: () {},
                  icon: const Icon(
                      Icons.settings,
                      size: 60,
                      color: Color.fromRGBO(217, 217, 217, 1.0),
                  )
              )
          )
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String text;

  const _MenuButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 260,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(163, 140, 104, 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color:  Color.fromRGBO(90, 80, 63, 1.0),
                fontSize: 32,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
                height: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}