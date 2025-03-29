import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/custom_switcher.dart';
import 'package:shelter_ai/presentation/ui_items/label.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/asset_image_item.dart';
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

  // Define consistent card dimensions
  double cardWidth = 10;
  double cardHeight = 10;

  // Store the active state for each row
  final Map<String, bool> _rowActiveStates = {
    "Возраст": false,
    "Здоровье": false,
    "Хобби/Навыки": false,
    "Фобии": false,
    "Багаж": false,
    "Дополнительная информация": false,
  };

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

  // Update the active state for a specific row
  void _updateRowActiveState(String label, bool isActive) {
    setState(() {
      _rowActiveStates[label] = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    cardWidth = MediaQuery.of(context).size.width * 0.9;
    cardHeight = MediaQuery.of(context).size.height * 0.9;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6B5642), Color(0xFFD1A881)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            GestureDetector(
              onTap: !_showFrontSide ? _flipCard : null,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final angle = _animation.value * pi;

                  // When the card is past the halfway point of animation,
                  // show the front face instead of the back face
                  if (angle >= pi / 2) {
                    // We need to apply a second transformation to fix the reversed text
                    // that would otherwise be displayed
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // perspective
                        ..rotateY(angle),
                      alignment: Alignment.center,
                      child: Transform(
                        transform: Matrix4.identity()..rotateY(pi),
                        alignment: Alignment.center,
                        child: _buildCardContainer(
                          isBackSide: false,
                          child: _buildFrontCardContent(),
                        ),
                      ),
                    );
                  } else {
                    // First half of animation - show the back face
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // perspective
                        ..rotateY(angle),
                      alignment: Alignment.center,
                      child: _buildCardContainer(
                        isBackSide: true,
                        child: _buildBackCardContent(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A shared container with consistent styling for both card sides
  Widget _buildCardContainer(
      {required bool isBackSide, required Widget child}) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: isBackSide ? const Color(0xFF8B7355) : const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }

  // Front card content only
  Widget _buildFrontCardContent() {
    return SingleChildScrollView(
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
          const SizedBox(height: 12),
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
          const SizedBox(height: 12),
          _buildStatRow("assets/images/hobby.png", "Возраст", "100%"),
          const SizedBox(height: 12),
          _buildStatRow("assets/images/hobby.png", "Здоровье", "80%"),
          const SizedBox(height: 12),
          _buildStatRow("assets/images/hobby.png", "Хобби/Навыки", "90%"),
          const SizedBox(height: 12),
          _buildStatRow("assets/images/hobby.png", "Фобии", "70%"),
          const SizedBox(height: 12),
          _buildStatRow("assets/images/hobby.png", "Багаж", "70%"),
          const SizedBox(height: 12),
          _buildStatRow(
              "assets/images/hobby.png", "Дополнительная информация", "70%"),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
              text: "Подтверить",
              onPressed: () {
                _flipCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Back card content only
  Widget _buildBackCardContent() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageItem(
          imagePath: "assets/images/door.png",
          width: 200,
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          "Нажмите, чтобы увидеть карту игрока",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStatRow(String assetsPath, String label, String value) {
    bool isActive = _rowActiveStates[label] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF6B5642),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // Change color based on active state
            color: isActive ? const Color(0xFFA38C68) : const Color(0x666B5642),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AssetImageItem(
                backgroundColor: const Color(0x80D9D9D9),
                imagePath: assetsPath,
                width: 60,
                height: 60,
                borderRadius: 4.0,
              ),
              const LabelWidget(
                  color: Color(0xFFD9D9D9),
                  text: "ddddddddddddddddddddddddddddd"),
              CustomSwitcher(
                initialValue: isActive,
                onToggle: (value) {
                  // Update the state in the parent widget
                  _updateRowActiveState(label, value);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
