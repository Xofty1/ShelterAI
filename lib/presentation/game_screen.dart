import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/data/repositories/gpt_repository_mock.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';
import 'package:shelter_ai/presentation/dialogs/lore_dialog.dart';
import 'package:shelter_ai/presentation/dialogs/settings_dialog.dart';
import 'package:shelter_ai/presentation/discussion_screen.dart';
import 'package:shelter_ai/presentation/loader_screen.dart';
import 'package:shelter_ai/presentation/lore_screen.dart';
import 'package:shelter_ai/presentation/player_card.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/vote_result_screen.dart';

import '../domain/bloc/app_settings_cubit.dart';
import '../domain/bloc/game_bloc.dart';
import '../domain/models/disaster.dart';
import '../l10n/l10n.dart';
import 'game_finish_screen.dart';
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

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context).exitGameTitle),
            content: Text(AppLocalizations.of(context).exitGameMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(AppLocalizations.of(context).cancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(AppLocalizations.of(context).exit),
              ),
            ],
          ),
        ) ??
        false;
  }

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
    const headerColor = Color(0xFFB8A876);
    const headerTextColor = Color(0xFF482020);
    const votingPlayerHeaderColor = Color(0xFF604D4D);
    const voteHeaderColor = Color(0xFFAB9A7F);
    const buttonColor = Color(0xFF99582A);
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, gameState) {
        final runningState = gameState as RunningGameState;
        return WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context,  appSettingsState) =>
             Scaffold(
              body: Stack(
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        if (gameState.stage != GameStage.intro &&
                            gameState.stage != GameStage.roundStarted && gameState.stage != GameStage.finals && gameState.stage != GameStage.preFinalLoading )
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "РАУНД ${gameState.roundInfo.roundNumber}",
                                    style: const TextStyle(
                                      color: headerTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _showSettingsDialog(context, gameState),
                                      icon: const Icon(Icons.settings),
                                      color: headerTextColor,
                                      iconSize: 28,
                                      tooltip: 'Настройки',
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      onPressed: () =>
                                          _showLoreDialog(context, gameState),
                                      icon: const Icon(Icons.info_outline),
                                      color: headerTextColor,
                                      iconSize: 28,
                                      tooltip: 'Информация',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        Expanded(
                          child: switch (gameState.stage) {
                            GameStage.intro =>
                              LoreScreen(disaster: gameState.disaster),
                            GameStage.roundStarted => GameRoundScreen(
                                alivePlayerCount: gameState.players
                                    .where((element) =>
                                        (element.lifeStatus == LifeStatus.alive))
                                    .toList()
                                    .length
                                    .toString(),
                                deadPlayerCount: gameState.players
                                    .where((element) =>
                                        (element.lifeStatus != LifeStatus.alive))
                                    .toList()
                                    .length
                                    .toString(),
                                needToKickCount:
                                    gameState.roundInfo.kickedCount.toString(),
                                roundNumber:
                                    gameState.roundInfo.roundNumber.toString(),
                                showCharacteristicCount:
                                    gameState.roundInfo.openCount.toString()),
                            GameStage.openCards => PlayerCardScreen(
                              settings: appSettingsState,
                                players: gameState.players,
                                currentPlayerIndex: gameState.currentPlayerIndex,
                                openCount: gameState.roundInfo.openCount,
                              ),
                            GameStage.speaking => DiscussionScreen(
                                roundNumber: gameState.roundInfo.roundNumber,
                                seconds: gameState.settings.time,
                              ),
                            GameStage.voting => GameVotingScreen(
                                players: gameState.players,
                                canBeSelected: gameState.voteInfo.canBeSelected,
                                currentPlayerIndex: gameState.currentPlayerIndex,
                                roundNumber:
                                    gameState.roundInfo.roundNumber.toString(),
                              ),
                            GameStage.voteResult => VoteResultScreen(
                                kickedPlayers: gameState.players
                                    .where((player) => gameState
                                        .voteInfo.selectedIndexes
                                        .contains(gameState.players.indexOf(player)))
                                    .toList(),
                              ),
                            GameStage.preFinalLoading =>
                              const LoaderScreen(),
                            GameStage.finals => FinishScreen(
                                finalText: gameState.finals,
                                alivePlayers: gameState.players
                                    .where((element) =>
                                        element.lifeStatus == LifeStatus.alive)
                                    .toList(),
                                deadPlayers: gameState.players
                                    .where((element) =>
                                        element.lifeStatus != LifeStatus.alive)
                                    .toList(),
                              ),
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
