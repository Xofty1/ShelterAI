import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/bloc/game_bloc.dart';
import 'package:shelter_ai/domain/bloc/sound_cubit.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/ui_items/back_card_side.dart';
import 'dart:math';

import 'package:shelter_ai/presentation/ui_items/front_card_side.dart';

import 'package:shelter_ai/presentation/ui_items/state_card_row.dart';

import 'package:shelter_ai/presentation/ui_items/front_card_side.dart';

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
    if (_isAnimating) return;

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
    cardHeight = MediaQuery.of(context).size.height * 0.72;
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
                            child: PlayerCardFront(
                              player: widget.player,
                              openCount: widget.openCount,
                              selectedIndexes: selectedIndexes,
                              onToggle: _handleToggle,
                              onConfirm: () {
                                _flipCard(
                                  onComplete: () {
                                    BlocProvider.of<GameBloc>(context).add(
                                        OpenedPropertyGameEvent(
                                            selectedIndexes));
                                  },
                                );
                              },
                            ),
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
                          child: const PlayerCardBack(),
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
}