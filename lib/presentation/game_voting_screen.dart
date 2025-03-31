import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/player_card_voting.dart';

class GameVotingScreen extends StatefulWidget {
  final String roundCount;
  final int needToKickCount;
  final int totalPlayers;

  const GameVotingScreen({
    Key? key,
    required this.needToKickCount,
    required this.totalPlayers,
    required this.roundCount,
  }) : super(key: key);

  @override
  State<GameVotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<GameVotingScreen> {
  Set<int> selectedPlayers = {};

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
              child:  const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'РАУНД',
                      style: TextStyle(
                        color: headerTextColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '2',
                      style: TextStyle(
                        color: headerTextColor,
                        fontSize: 28,
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
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                color: votingPlayerHeaderColor,
                child: const Center(
                  child: Text(
                    'Голосует игрок номер 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400
                    ),
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
                    final isSelected = selectedPlayers.contains(index);
                    return GestureDetector(
                      onTap: () {
                        if (isSelected) {
                          setState(() {
                            selectedPlayers.remove(index);
                          });
                        } else if (selectedPlayers.length < widget.needToKickCount) {
                          setState(() {
                            selectedPlayers.add(index);
                          });
                        }
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PlayerCardVoting(
                              number: (index + 1).toString(),
                              name: 'Игрок ${index + 1}',
                              profession: 'Профессия ${index + 1}',
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
                    onPressed: selectedPlayers.length == widget.needToKickCount
                        ? () {
                      //!!!
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