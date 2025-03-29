import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/custom_switcher.dart';
import 'package:shelter_ai/presentation/ui_items/label.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_template.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'dart:math';

class PlayerCardScreen extends StatefulWidget {
  const PlayerCardScreen({super.key});

  @override
  State<PlayerCardScreen> createState() => _PlayerCardScreenState();
}

class _PlayerCardScreenState extends State<PlayerCardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showFrontSide = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutBack,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_showFrontSide) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      name: "Раунд 1",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _flipCard,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final angle = _animation.value * pi;
                final transform = Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle);

                return Transform(
                  transform: transform,
                  alignment: Alignment.center,
                  child: angle >= pi / 2
                      ? Transform(
                          transform: Matrix4.identity()..rotateY(pi),
                          alignment: Alignment.center,
                          child: _buildFrontCard(),
                        )
                      : _buildBackCard(),
                );
              },
            ),
          ),
          if (_showFrontSide) ...[],
        ],
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xFF6B5642), width: 2),
              ),
              child: const Icon(
                Icons.person,
                size: 70,
                color: Color(0xFF6B5642),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Игрок 1",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A503F),
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildStatRow("Здоровье", "100%"),
          const SizedBox(height: 15),
          _buildStatRow("Сытость", "80%"),
          const SizedBox(height: 15),
          _buildStatRow("Рассудок", "90%"),
          const SizedBox(height: 15),
          _buildStatRow("Усталость", "70%"),
          const SizedBox(height: 40),
          Center(
            child: CustomButton(
              text: "Подтверить выбор",
              onPressed: () {
                // Handle next turn
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0xFF8B7355),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage("assets/images/door.png"),
          fit: BoxFit.scaleDown,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          "Нажмите, чтобы увидеть карту игрока",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF5A503F),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: Image.asset("assets/images/door.png"),
              ),
              const LabelWidget(
                  text: "ddddddddddddddddddddddddddddd"
                      "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"),
              CustomSwitcher(
                initialValue: false,
                onToggle: (value) {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
