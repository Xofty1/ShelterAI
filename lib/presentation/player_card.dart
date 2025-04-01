import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/bloc/game_bloc.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/asset_image_item.dart';
import 'dart:math';

import 'package:shelter_ai/presentation/ui_items/state_card_row.dart';

class PlayerCardScreen extends StatefulWidget {
  final int openCount;
  final List<Player> players;

  Player get player => players[currentPlayerIndex];

  final int currentPlayerIndex;

  const PlayerCardScreen(
      {super.key,
      required this.players,
      required this.currentPlayerIndex,
      required this.openCount});

  @override
  State<PlayerCardScreen> createState() => _PlayerCardScreenState();
}

class _PlayerCardScreenState extends State<PlayerCardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showFrontSide = false;
  double cardWidth = 10;
  double cardHeight = 10;

  List<int> selectedIndexes = [];

  bool _isAnimating = false;

  void _handleToggle(int index, bool value) {
    setState(() {
      if (value) {
        if (selectedIndexes.length < widget.openCount) {
          selectedIndexes.add(index);
        }
      } else {
        selectedIndexes.remove(index);
      }
    });
  }

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
  void didUpdateWidget(PlayerCardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      selectedIndexes.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard({VoidCallback? onComplete}) {
    if (_isAnimating) return; // Если анимация уже идет, ничего не делаем

    setState(() {
      _isAnimating = true;
      _showFrontSide = !_showFrontSide;
    });

    if (_showFrontSide) {
      _controller.forward().then((_) {
        setState(() => _isAnimating = false);
        onComplete?.call();
      });
    } else {
      _controller.reverse().then((_) {
        setState(() => _isAnimating = false);
        onComplete?.call();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    cardWidth = MediaQuery.of(context).size.width * 0.9;
    cardHeight = MediaQuery.of(context).size.height * 0.82;
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
              onTap: !_showFrontSide && !_isAnimating ? _flipCard : null,
              child: IgnorePointer(
                ignoring: _isAnimating,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final angle = _animation.value * pi;
                    if (angle >= pi / 2) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
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
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
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
      padding: const EdgeInsets.only(bottom: 10),
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
          Center(
            child: Text(
              widget.player.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A503F),
              ),
            ),
          ),
          const SizedBox(height: 12),
          StateCardRow(
              label: "Возраст",
              assetsPath: "assets/images/hobby.png",
              initialActive: widget.player.knownProperties[0],
              isWorked: selectedIndexes.length < widget.openCount,
              content: widget.player.bio,
              onToggle: (value) {
                _handleToggle(0, value);
              }),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Здоровье",
            assetsPath: "assets/images/hobby.png",
            initialActive: widget.player.knownProperties[1],
            isWorked: selectedIndexes.length < widget.openCount,
            content: widget.player.health,
            onToggle: (value) {
              _handleToggle(1, value);
            },
          ),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Хобби/Навыки",
            assetsPath: "assets/images/hobby.png",
            initialActive: widget.player.knownProperties[2],
            isWorked: selectedIndexes.length < widget.openCount,
            content: widget.player.hobby,
            onToggle: (value) {
              _handleToggle(2, value);
            },
          ),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Фобии",
            assetsPath: "assets/images/hobby.png",
            initialActive: widget.player.knownProperties[3],
            isWorked: selectedIndexes.length < widget.openCount,
            content: widget.player.phobia,
            onToggle: (value) {
              _handleToggle(3, value);
            },
          ),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Багаж",
            assetsPath: "assets/images/hobby.png",
            initialActive: widget.player.knownProperties[4],
            isWorked: selectedIndexes.length < widget.openCount,
            content: widget.player.luggage,
            onToggle: (value) {
              _handleToggle(4, value);
            },
          ),
          const SizedBox(height: 12),
          StateCardRow(
            label: "Дополнительная информация",
            assetsPath: "assets/images/hobby.png",
            initialActive: widget.player.knownProperties[5],
            isWorked: selectedIndexes.length < widget.openCount,
            content: widget.player.extra,
            onToggle: (value) {
              _handleToggle(5, value);
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: Opacity(
              opacity: selectedIndexes.length != widget.openCount ? 0.6 : 1.0,
              child: IgnorePointer(
                ignoring: selectedIndexes.length != widget.openCount,
                child: CustomButton(
                  text: "Подтверить",
                  onPressed: () {
                    _flipCard(onComplete: () {
                      BlocProvider.of<GameBloc>(context)
                          .add(OpenedPropertyGameEvent(selectedIndexes));
                    });
                  },
                ),
              ),
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
}
