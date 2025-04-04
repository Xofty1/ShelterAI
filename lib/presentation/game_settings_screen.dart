import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/core/di/game_settings_dep.dart';
import 'package:shelter_ai/core/di/global_dep.dart';
import 'package:shelter_ai/domain/bloc/app_settings_cubit.dart';
import 'package:shelter_ai/domain/bloc/game_settings_cubit.dart';
import 'package:shelter_ai/l10n/l10n.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/custom_switcher.dart';
import 'package:shelter_ai/presentation/ui_items/label.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';
import 'package:shelter_ai/presentation/ui_items/text_field_custom.dart';
import '../core/navigation/navigation_manager.dart';
import 'loader_screen.dart';

class GameSettingsWidget extends StatefulWidget {
  const GameSettingsWidget({super.key});

  @override
  State<GameSettingsWidget> createState() => _GameSettingsWidgetState();
}

class _GameSettingsWidgetState extends State<GameSettingsWidget> {
  final GameSettingsDepHolder gameSettingsDepHolder = GameSettingsDepHolder();

  @override
  void didChangeDependencies() {
    if (!gameSettingsDepHolder.isCreated) {
      final globalDepContainer =
          RepositoryProvider.of<GlobalDepHolder>(context).container!;
      gameSettingsDepHolder.create(globalDepContainer);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    gameSettingsDepHolder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final container = gameSettingsDepHolder.container;

    if (container == null) {
      return const SizedBox.shrink();
    }

    return BlocProvider.value(
      value: container.gameSettingsCubit,
      child: const GameSettingsScreen(),
    );
  }
}

class GameSettingsScreen extends StatefulWidget {
  const GameSettingsScreen({super.key});

  @override
  State<GameSettingsScreen> createState() => _GameSettingsScreenState();
}

class _GameSettingsScreenState extends State<GameSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    const headerColor = Color(0xFFB8A876);
    const headerTextColor = Color(0xFF482020);

    final loc = AppLocalizations.of(context);
    return BlocListener<GameSettingsCubit, GameSettingsState>(
      listener: (context, state) {
        if (state is DisasterUploadedState) {
          NavigationManager.instance.openGameReplacement(
              state.settings, state.disaster, state.players);
        } else if (state is ErrorLoadingGameState) {
          final snackBar = SnackBar(content: Text(loc.dataLoadingError));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          NavigationManager.instance.pop();
        }
      },
      child: BlocBuilder<GameSettingsCubit, GameSettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFD3C0AA),
              title: Text(loc.game_settings),
              centerTitle: true,
            ),
            body: state is DisasterLoadingState ||
                    state is DisasterUploadedState
                ? const LoaderScreen()
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF8B7355), Color(0xFFD1A881)],
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          // Main settings container
                          SettingsContainer(
                            child: Column(
                              children: [
                                // Players count
                                SettingHeader(text: loc.countPlayers),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: LabelWidget(
                                        text: state.settings.playersCount
                                            .toString(),
                                      ),
                                    ),
                                    Expanded(
                                      child: SliderSettings(
                                        defaultValue: state
                                            .settings.playersCount
                                            .toDouble(),
                                        min: 4,
                                        max: 16,
                                        onChange: (value) => BlocProvider.of<
                                                GameSettingsCubit>(context)
                                            .updatePlayersCount(
                                                value.toInt()),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                // Difficulty
                                SettingHeader(text: loc.difficultySettings),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DifficultyButton(
                                        text: loc.difficultyClassic,
                                        isSelected:
                                            state.settings.difficulty == 1,
                                        onTap: () => BlocProvider.of<
                                                GameSettingsCubit>(context)
                                            .updateDifficulty(1)),
                                    DifficultyButton(
                                        text: loc.difficultyHardcore,
                                        isSelected:
                                            state.settings.difficulty == 2,
                                        onTap: () => BlocProvider.of<
                                                GameSettingsCubit>(context)
                                            .updateDifficulty(2)),
                                    DifficultyButton(
                                        text: loc.difficultyInsanity,
                                        isSelected:
                                            state.settings.difficulty == 3,
                                        onTap: () => BlocProvider.of<
                                                GameSettingsCubit>(context)
                                            .updateDifficulty(3)),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Game tone
                                SettingHeader(text: loc.gameTone),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    LabelWidget(
                                      text: loc.family,
                                    ),
                                    CustomSwitcher(
                                      initialValue: state.settings.safeMode,
                                      onToggle: (value) {
                                        BlocProvider.of<GameSettingsCubit>(
                                                context)
                                            .updateSafeMode(value);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Plot wishes
                          SettingsContainer(
                            child: CustomTextField(
                              text: loc.plotWishes,
                              initialValue: state.settings.plot,
                              onChange: (value) {
                                BlocProvider.of<GameSettingsCubit>(context)
                                    .updatePlot(value);
                              },
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Time
                          SettingsContainer(
                            child: Column(
                              children: [
                                SettingHeader(text: loc.time),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          child: LabelWidget(
                                            text: state.settings.time
                                                .toString(),
                                          ),
                                        ),
                                        Expanded(
                                          child: SliderSettings(
                                            defaultValue: state.settings.time
                                                .toDouble(),
                                            min: 30,
                                            max: 120,
                                            onChange: (value) => BlocProvider
                                                    .of<GameSettingsCubit>(
                                                        context)
                                                .updateTime(value.toInt()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // Random mode
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ToneButton(
                                        text: loc.random,
                                        isSelected: false,
                                        onTap: () {
                                          // Random mode can be added to your GameSettings model
                                        },
                                        width: 160),
                                    CustomSwitcher(
                                      initialValue: false,
                                      onToggle: (value) {
                                        // Random mode toggle can be added to your GameSettings model
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Continue button
                          CustomButton(
                            text: loc.continueWord,
                            onPressed: () {
                              final language =
                                  BlocProvider.of<AppSettingsCubit>(context)
                                      .state
                                      .settings
                                      .loc;
                              BlocProvider.of<GameSettingsCubit>(context)
                                  .startGame(language);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class SettingsContainer extends StatelessWidget {
  final Widget child;

  const SettingsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

class SettingHeader extends StatelessWidget {
  final String text;

  const SettingHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class ToneButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;

  const ToneButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.8)
              : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black87 : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class DifficultyButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const DifficultyButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.8)
              : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: const Color(0xFF8B7355), width: 2)
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.black87 : Colors.black54,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
