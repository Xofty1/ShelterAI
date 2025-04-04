import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/core/di/game_dep.dart';
import 'package:shelter_ai/core/di/global_dep.dart';
import 'package:shelter_ai/domain/bloc/sound_cubit.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/presentation/dialogs/lore_dialog.dart';
import 'package:shelter_ai/presentation/dialogs/round_info_dialog.dart';
import 'package:shelter_ai/presentation/dialogs/settings_dialog.dart';
import 'package:shelter_ai/presentation/discussion_screen.dart';
import 'package:shelter_ai/presentation/loader_screen.dart';
import 'package:shelter_ai/presentation/lore_screen.dart';
import 'package:shelter_ai/presentation/player_card.dart';
import 'package:shelter_ai/presentation/player_list_screen.dart';
import 'package:shelter_ai/presentation/vote_result_screen.dart';

import '../core/theme/app_colors.dart';
import '../domain/bloc/game_bloc.dart';
import '../domain/models/disaster.dart';
import '../l10n/l10n.dart';
import 'game_finish_screen.dart';
import 'game_round_screen.dart';
import 'game_votting_screen.dart';

class GameScreenWidget extends StatefulWidget {
  const GameScreenWidget({super.key});

  @override
  State<GameScreenWidget> createState() => _GameScreenWidgetState();
}

class _GameScreenWidgetState extends State<GameScreenWidget> {
  final GameDepHolder gameDepHolder = GameDepHolder();

  late final GameSettings gameSettings;
  late final Disaster disaster;
  late final List<Player> players;

  @override
  void didChangeDependencies() {
    if (!gameDepHolder.isCreated) {
      context.read<SoundCubit>().pauseMusic();
      final globalDepContainer =
          RepositoryProvider.of<GlobalDepHolder>(context).container;

      if (globalDepContainer != null) {
        gameDepHolder.create(globalDepContainer);
      }

      final args =
          ModalRoute.of(context)!.settings.arguments! as Map<String, Object>;
      gameSettings = args['settings'] as GameSettings;
      disaster = args['disaster'] as Disaster;
      players = args['players'] as List<Player>;

      gameDepHolder.container?.gameBloc
          .add(StartedGameEvent(gameSettings, disaster, players));
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    gameDepHolder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final container = gameDepHolder.container;

    if (container == null) {
      return const SizedBox.shrink();
    }

    return BlocProvider.value(
      value: container.gameBloc,
      child: const GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    bool result = await showDialog(
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

    if (result && context.mounted) {
      context.read<SoundCubit>().pauseText();
      context.read<SoundCubit>().resumeMusic();
    }
    return result;
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

  void _showPlayersScreen(BuildContext context, RunningGameState state) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          PlayersListScreen(players: state.players),
    );
  }

  void _showRoundInfoDialog(BuildContext context, RunningGameState state) {
    showDialog(
      context: context,
      builder: (BuildContext context) => RoundInfoDialog(
        roundInfo: state.roundInfo,
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

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: AppColors.mainGradient,
          ),
          child: SafeArea(
            child: BlocListener<GameBloc, GameState>(
              listenWhen: (context, state) => state is RunningGameState,
              listener: (context, state) {
                state as RunningGameState;
                if (state.stage == GameStage.intro) {
                  context
                      .read<SoundCubit>()
                      .playText(state.disaster.disasterDescription);
                } else if (state.stage == GameStage.finals) {
                  context.read<SoundCubit>().playText(state.finals);
                } else {
                  context.read<SoundCubit>().pauseText();
                }
              },
              child: BlocBuilder<GameBloc, GameState>(
                builder: (context, gameState) {
                  if (gameState is RunningGameState) {
                    return Column(
                      children: [
                        if (gameState.stage != GameStage.waiting &&
                            gameState.stage != GameStage.intro &&
                            gameState.stage != GameStage.roundStarted &&
                            gameState.stage != GameStage.finals &&
                            gameState.stage != GameStage.preFinalLoading)
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
                            child: GestureDetector(
                              onTap: () =>
                                  _showRoundInfoDialog(context, gameState),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${loc.round} ${gameState.roundInfo.roundNumber}",
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
                                        onPressed: () => _showPlayersScreen(
                                            context, gameState),
                                        icon:
                                            const Icon(Icons.account_box_sharp),
                                        color: headerTextColor,
                                        iconSize: 28,
                                        tooltip: loc.allPlayers,
                                      ),
                                      IconButton(
                                        onPressed: () => _showSettingsDialog(
                                            context, gameState),
                                        icon: const Icon(Icons.settings),
                                        color: headerTextColor,
                                        iconSize: 28,
                                        tooltip: loc.settings,
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            _showLoreDialog(context, gameState),
                                        icon: const Icon(Icons.info_outline),
                                        color: headerTextColor,
                                        iconSize: 28,
                                        tooltip: loc.information,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Expanded(
                          child: switch (gameState.stage) {
                            GameStage.preFinalLoading ||
                            GameStage.waiting =>
                              const LoaderScreen(),
                            GameStage.intro =>
                              LoreScreen(disaster: gameState.disaster),
                            GameStage.roundStarted => GameRoundScreen(
                                alivePlayerCount:
                                    gameState.alive.length.toString(),
                                deadPlayerCount:
                                    gameState.kicked.length.toString(),
                                needToKickCount:
                                    gameState.roundInfo.kickedCount.toString(),
                                roundNumber:
                                    gameState.roundInfo.roundNumber.toString(),
                                showCharacteristicCount:
                                    gameState.roundInfo.openCount.toString()),
                            GameStage.openCards => PlayerCardScreen(
                                players: gameState.players,
                                currentPlayerIndex:
                                    gameState.currentPlayerIndex,
                                openCount: gameState.roundInfo.openCount,
                              ),
                            GameStage.speaking => DiscussionScreen(
                                roundNumber: gameState.roundInfo.roundNumber,
                                seconds: gameState.settings.time,
                                players: gameState.players,
                              ),
                            GameStage.voting => GameVotingScreen(
                                players: gameState.players,
                                canBeSelected: gameState.voteInfo.canBeSelected,
                                currentPlayerIndex:
                                    gameState.currentPlayerIndex,
                                roundNumber:
                                    gameState.roundInfo.roundNumber.toString(),
                              ),
                            GameStage.voteResult => VoteResultScreen(
                                kickedPlayers: gameState.playersKickedThisTurn,
                              ),
                            GameStage.finals => FinishScreen(
                                finalText: gameState.finals,
                                alivePlayers: gameState.alive,
                                deadPlayers: gameState.kicked,
                              ),
                          },
                        )
                      ],
                    );
                  }

                  return const LoaderScreen();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
