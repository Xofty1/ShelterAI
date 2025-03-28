import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/bloc/game_settings_cubit.dart';
import 'package:shelter_ai/l10n/l10n.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/label.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_template.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';
import 'package:shelter_ai/presentation/ui_items/text_field_custom.dart';

class GameSettingsWidget extends StatelessWidget {
  const GameSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GameSettingsCubit(),
        child: const GameSettingsScreen(),
    );
  }
}

class GameSettingsScreen extends StatelessWidget {
  const GameSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return BlocBuilder<GameSettingsCubit, GameSettingsState>(
      builder: (context, state) => ScaffoldTemplate(
        name: loc.game_settings,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const LabelWidget(text: "Количество игроков"),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70,
                        child: LabelWidget(
                          text: state.settings.playersCount.toString(),
                        ),
                      ),
                      Expanded(
                        child: SliderSettings(
                          defaultValue: 10,
                          min: 4,
                          max: 22,
                          onChange: (value) =>
                              BlocProvider.of<GameSettingsCubit>(context)
                                  .updatePlayersCount(value.toInt()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomTextField(
                text: "Введите пожелания по сюжету",
                onChange: (value) {
                  BlocProvider.of<GameSettingsCubit>(context).updatePlot(value);
                },
              ),
            ),
            const SizedBox(height: 16),
            // Вторая настройка
            Container(
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const LabelWidget(text: "Время"),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70,
                        child: LabelWidget(
                          text: state.settings.time.toString(),
                        ),
                      ),
                      Expanded(
                        child: SliderSettings(
                            defaultValue: 33,
                            min: 30,
                            max: 120,
                            onChange: (value) =>
                                BlocProvider.of<GameSettingsCubit>(context)
                                    .updateTime(value.toInt())),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Продолжить',
              onPressed: () {
                Navigator.pushNamed(context, '/player_card');
              },
            ),
          ],
        ),
      ),
    );
  }
}
