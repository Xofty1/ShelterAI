import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/core/navigation/navigation_manager.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/player_list_screen.dart';
import 'package:shelter_ai/presentation/ui_items/player_tap_card.dart';
import '../../l10n/l10n.dart';
import '../domain/bloc/sound_cubit.dart';

class FinishScreen extends StatelessWidget {
  final List<Player> alivePlayers;
  final List<Player> deadPlayers;
  final String finalText;

  const FinishScreen(
      {super.key,
      required this.alivePlayers,
      required this.deadPlayers,
      required this.finalText});

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
    const buttonColor = Color(0xFF99582A);
    const aliveTitleColor = Color(0xFFD7BC91);
    const avileTitleTextColor = Color(0xFF432818);
    const deadTextColor = Color(0xFFE9E1DD);
    const deadTitleColor = Color(0xFF6E5227);

    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              color: headerColor,
              child: Center(
                child: Text(
                  loc.finale,
                  style: const TextStyle(
                      color: headerTextColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: const Color(0xFFA38C68),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Text(
                          finalText,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              color: aliveTitleColor,
              child: Center(
                child: Text(
                  loc.inBunker,
                  style: const TextStyle(
                      color: avileTitleTextColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              children: List.generate(alivePlayers.length, (index) {
                return GestureDetector(
                  onTap: () =>
                      _showPlayersScreen(context, alivePlayers),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlayerTapCard(
                      player: alivePlayers[index],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              color: deadTitleColor,
              child: Center(
                child: Text(
                  loc.notInBunker,
                  style: const TextStyle(
                      color: deadTextColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              children: List.generate(deadPlayers.length, (index) {
                return GestureDetector(
                  onTap: () =>
                      _showPlayersScreen(context, deadPlayers),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlayerTapCard(
                      player: deadPlayers[index],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<SoundCubit>().pauseText();
                    context.read<SoundCubit>().resumeMusic();
                    NavigationManager.instance.openHomeReplacement();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    loc.finish,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
