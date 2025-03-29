import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/game_state.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';
import 'package:shelter_ai/domain/services/random_gpt_repository.dart';
import 'package:shelter_ai/presentation/lore_screen.dart';
import 'package:shelter_ai/presentation/player_card.dart';

import '../domain/bloc/game_bloc.dart';
import '../l10n/l10n.dart';

class GameScreenWidget extends StatelessWidget {
  const GameScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a RandomGPTRepository instance
    GPTRepository repository = RandomGPTRepository();

    return BlocProvider(
      create: (context) => GameBloc(repository)
        ..add(StartedGameEvent(const GameSettings(
            playersCount: 1,
            difficulty: 1,
            plot: "1",
            safeMode: true,
            time: 1))),
      child: const GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is LoadingGameState)
          return const CircularProgressIndicator();
        else {
          return switch ((state as RunningGameState).stage) {
            GameStage.intro => const LoreScreen(),
            GameStage.roundStarted => const PlayerCardScreen(),
            GameStage.openCards => const PlayerCardScreen(),
            GameStage.speaking => throw UnimplementedError(),
            GameStage.voting => throw UnimplementedError(),
            GameStage.voteResult => throw UnimplementedError(),
            GameStage.finals => throw UnimplementedError(),
          };
        }
      },
    );
  }
}
