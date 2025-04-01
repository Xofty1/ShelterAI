import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/data/repositories/gpt_repository_mock.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';
import 'package:shelter_ai/presentation/dialogs/lore_dialog.dart';
import 'package:shelter_ai/presentation/dialogs/settings_dialog.dart';
import 'package:shelter_ai/presentation/lore_screen.dart';
import 'package:shelter_ai/presentation/player_card.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';

import '../domain/bloc/game_bloc.dart';
import '../domain/models/disaster.dart';
import '../l10n/l10n.dart';
import 'game_round_screen.dart';
import 'game_votting_screen.dart';

class GameScreenWidget extends StatelessWidget {
  const GameScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: DI
    GPTRepository repository = GPTRepositoryMock();
    final args =
        ModalRoute.of(context)!.settings.arguments! as Map<String, Object>;

    final gameSettings = args['settings'] as GameSettings;
    final disaster = args['disaster'] as Disaster;
    final players = args['players'] as List<Player>;

    return BlocProvider(
      create: (context) => GameBloc(
        repository: repository,
        settings: gameSettings,
        disaster: disaster,
        players: players,
      ),
      child: const GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  void _showLoreDialog(BuildContext context, RunningGameState state) {
    showDialog(
      context: context,
      builder: (BuildContext context) => LoreDialog(
        disaster: state.disaster,
      ),
    );
  }

  void _showSettingsDialog(BuildContext context, RunningGameState state) {
    showDialog(
      context: context,
      builder: (BuildContext context) => SettingsDialog(
        settings: state.settings,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final runningState = state as RunningGameState;
        return Scaffold(
          body: Stack(
            children: [
              // Main game content based on stage
              _buildGameContent(context, runningState),

              // Floating buttons for lore and settings
              Positioned(
                top: 40,
                right: 16,
                child: Column(
                  children: [
                    _buildFloatingButton(
                      context: context,
                      icon: Icons.info_outline,
                      tooltip: "Информация о катастрофе",
                      onPressed: () => _showLoreDialog(context, runningState),
                    ),
                    const SizedBox(height: 12),
                    _buildFloatingButton(
                      context: context,
                      icon: Icons.settings,
                      tooltip: "Настройки игры",
                      onPressed: () =>
                          _showSettingsDialog(context, runningState),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGameContent(BuildContext context, RunningGameState state) {
    return switch (state.stage) {
      GameStage.intro => LoreScreen(disaster: state.disaster),
      GameStage.roundStarted => GameRoundScreen(
          alivePlayerCount: state.players
              .where((element) => (element.lifeStatus == LifeStatus.alive))
              .toList()
              .length
              .toString(),
          deadPlayerCount: state.players
              .where((element) => (element.lifeStatus != LifeStatus.alive))
              .toList()
              .length
              .toString(),
          needToKickCount: state.roundInfo.kickedCount.toString(),
          roundNumber: state.roundInfo.roundNumber.toString(),
          showCharacteristicCount: state.roundInfo.openCount.toString()),
      GameStage.openCards => PlayerCardScreen(
          players: state.players,
          currentPlayerIndex: state.currentPlayerIndex,
          openCount: state.roundInfo.openCount,
        ),
      GameStage.speaking => Column(
          children: [
            Text(state.roundInfo.roundNumber.toString()),
            CustomButton(
              text: "Дальше",
              onPressed: () => BlocProvider.of<GameBloc>(context).add(
                ReadyGameEvent(),
              ),
            ),
          ],
        ),
      GameStage.voting => GameVotingScreen(
          players: state.players,
          currentPlayerIndex: state.currentPlayerIndex,
          roundNumber: state.roundInfo.roundNumber.toString(),
          totalPlayers: state.settings.playersCount,
        ),
      GameStage.voteResult => Column(
          children: [
            Text("state.roundInfo.roundNumber.toString()"),
            CustomButton(
              text: "Дальше",
              onPressed: () => BlocProvider.of<GameBloc>(context).add(
                ReadyGameEvent(),
              ),
            ),
          ],
        ),
      GameStage.finals => const Center(child: Text("Финал")),
    };
  }

  Widget _buildFloatingButton({
    required BuildContext context,
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        mini: true,
        backgroundColor: const Color(0xFF8B7355),
        foregroundColor: Colors.white,
        elevation: 0,
        child: Icon(icon),
      ),
    );
  }
}
