import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/presentation/ui_items/player_votting_card.dart';

import '../domain/bloc/game_bloc.dart';
import '../domain/models/player.dart';

class GameVotingScreen extends StatefulWidget {
  final String roundNumber;
  final int totalPlayers;
  final List<Player> players;

  Player get player => players[currentPlayerIndex];

  final int currentPlayerIndex;

  const GameVotingScreen({
    Key? key,
    required this.totalPlayers,
    required this.roundNumber,
    required this.players,
    required this.currentPlayerIndex,
  }) : super(key: key);

  @override
  State<GameVotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<GameVotingScreen> {
  int? selectedPlayer;

  @override
  void didUpdateWidget(GameVotingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      selectedPlayer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    const headerColor = Color(0xFFB8A876);
    const headerTextColor = Color(0xFF482020);
    const votingPlayerHeaderColor = Color(0xFF604D4D);
    const voteHeaderColor = Color(0xFFAB9A7F);
    const buttonColor = Color(0xFF99582A);
    const circleButtonColor = Color(0xFF9E4A42);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8B7355), Color(0xFF5E503D)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: headerColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "РАУНД ${widget.roundNumber}",
                        style: const TextStyle(
                          color: headerTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                color: voteHeaderColor,
                child: const Center(
                  child: Text(
                    'Голосование',
                    style: TextStyle(
                        color: headerTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                color: votingPlayerHeaderColor,
                child: Center(
                  child: Text(
                    "Голосует игрок ${widget.player.name}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  children: List.generate(widget.totalPlayers, (index) {
                    final isSelected = index == selectedPlayer;
                    return GestureDetector(
                      onTap: () {
                        if (isSelected) {
                          setState(() {
                            selectedPlayer = null;
                          });
                        } else {
                          setState(() {
                            selectedPlayer = index;
                          });
                        }
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PlayerCardVoting(
                              number: (index + 1).toString(),
                              name: widget.players[index].name,
                              profession: widget.players[index].profession,
                            ),
                          ),
                          if (isSelected)
                            Positioned(
                              right: 16,
                              top: 16,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: Colors.brown,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: selectedPlayer != null
                        ? () {
                            BlocProvider.of<GameBloc>(context).add(VotedGameEvent(selectedPlayer ?? 0)); /// Exception
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      disabledBackgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'ПОДТВЕРДИТЬ ГОЛОС',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
