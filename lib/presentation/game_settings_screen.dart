import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/core/di/game_settings_dep.dart';
import 'package:shelter_ai/core/di/global_dep.dart';
import 'package:shelter_ai/data/repositories/gpt_api.dart';
import 'package:shelter_ai/data/repositories/gpt_repository_mock.dart';
import 'package:shelter_ai/domain/bloc/app_settings_cubit.dart';
import 'package:shelter_ai/domain/bloc/game_settings_cubit.dart';
import 'package:shelter_ai/l10n/l10n.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/choose_button.dart';
import 'package:shelter_ai/presentation/ui_items/custom_switcher.dart';
import 'package:shelter_ai/presentation/ui_items/label.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';
import 'package:shelter_ai/presentation/ui_items/text_field_custom.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

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
    return BlocProvider.value(
      value: gameSettingsDepHolder.container!.gameSettingsCubit,
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
    final loc = AppLocalizations.of(context);
    return BlocListener<GameSettingsCubit, GameSettingsState>(
      listener: (context, state) {
        if (state is DisasterUploadedState) {
          NavigationManager.instance.openOfflineGameReplacement(
              state.settings, state.disaster, state.players);
        } else if (state is OnlineDisasterUploadedState) {
          NavigationManager.instance
              .openOnlineGameReplacement(state.gameState, state.room);
        } else if (state is ErrorLoadingGameState) {
          const snackBar = SnackBar(content: Text('Ошибка загрузки данных'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          NavigationManager.instance.pop();
        }
      },
      child: BlocBuilder<GameSettingsCubit, GameSettingsState>(
        builder: (context, state) {
          return Scaffold(
            body: state is DisasterLoadingState ||
                    state is DisasterUploadedState
                ? const LoaderScreen()
                : DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF8B7355), Color(0xFFD1A881)],
                      ),
                    ),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: Column(
                          children: [
                            // Main settings container
                            _buildSettingsContainer(
                              child: Column(
                                children: [
                                  _buildSettingHeader("Режим"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ChooseButton(
                                          text: "На устройстве",
                                          isSelected: !state.settings.isOnline,
                                          onTap: () => BlocProvider.of<
                                                  GameSettingsCubit>(context)
                                              .updateIsOnline(false)),
                                      ChooseButton(
                                          text: "Мультиплеер",
                                          isSelected: state.settings.isOnline,
                                          onTap: () => BlocProvider.of<
                                                  GameSettingsCubit>(context)
                                              .updateIsOnline(true)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  // Players count
                                  _buildSettingHeader("Количество игроков"),
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
                                          max: 22,
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
                                  _buildSettingHeader("Сложность"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ChooseButton(
                                          text: loc.difficultyClassic,
                                          isSelected:
                                              state.settings.difficulty == 1,
                                          onTap: () => BlocProvider.of<
                                                  GameSettingsCubit>(context)
                                              .updateDifficulty(1)),
                                      ChooseButton(
                                          text: loc.difficultyHardcore,
                                          isSelected:
                                              state.settings.difficulty == 2,
                                          onTap: () => BlocProvider.of<
                                                  GameSettingsCubit>(context)
                                              .updateDifficulty(2)),
                                      ChooseButton(
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
                                  _buildSettingHeader("Тон игры"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const LabelWidget(
                                        text: "Семейный",
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
                            _buildSettingsContainer(
                              child: CustomTextField(
                                text: "Введите пожелания по сюжету",
                                onChange: (value) {
                                  BlocProvider.of<GameSettingsCubit>(context)
                                      .updatePlot(value);
                                },
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Time
                            _buildSettingsContainer(
                              child: Column(
                                children: [
                                  _buildSettingHeader("Время"),
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
                                      _buildToneButton("Рандом", false, () {
                                        // Random mode can be added to your GameSettings model
                                      }, width: 160),
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
                              text: 'Продолжить',
                              onPressed: () async {
                                final language =
                                    BlocProvider.of<AppSettingsCubit>(context)
                                        .state
                                        .settings
                                        .loc;
                                BlocProvider.of<GameSettingsCubit>(context)
                                    .startGame(language);
                              },
                            ),

                            // Room Info Widget
                            if (state is DisasterUploadedState &&
                                state.settings.isOnline &&
                                state.roomId != null)
                              _buildRoomInfoWidget(
                                  context, state.roomId!, state.roomPassword!),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildSettingsContainer({required Widget child}) {
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

  Widget _buildSettingHeader(String text) {
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

  Widget _buildToneButton(String text, bool isSelected, VoidCallback onTap,
      {double width = 100}) {
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

  Widget _buildRoomInfoWidget(
      BuildContext context, String roomId, String password) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: [
          const Text(
            'Room Created!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Room ID', roomId),
          const SizedBox(height: 8),
          _buildInfoRow('Password', password),
          const SizedBox(height: 16),
          const Text(
            'Share these details with other players to join',
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: value));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Copied to clipboard'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: Row(
            children: [
              Text(value),
              const SizedBox(width: 4),
              const Icon(Icons.copy, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
