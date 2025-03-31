import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/bloc/game_settings_cubit.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';
import 'package:shelter_ai/presentation/ui_items/label.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_template.dart';
import 'package:shelter_ai/presentation/ui_items/slider_settings.dart';
import 'package:shelter_ai/presentation/ui_items/text_field_custom.dart';

import '../core/app_shared_preference/app_shared_preference.dart';

class GameSettingsWidget extends StatelessWidget {
  const GameSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GameSettingsCubit(),
        child: const GameSettingsScreen(),
      ),
    );
  }
}

class GameSettingsScreen extends StatelessWidget {
  const GameSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameSettingsCubit, GameSettingsState>(
      builder: (context, state) =>
          ScaffoldTemplate(
            name: "Настройки игры",
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
                          Expanded(
                            child: SliderSettings(
                              defaultValue: 10,
                              min: 4,
                              max: 22,
                              loadSetting: () => 6,
                              saveSetting: (value) async => BlocProvider
                                  .of<GameSettingsCubit>(context)
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
                        text: "Введите пожелания по сюжету", onChange: (value) {
                      BlocProvider
                          .of<GameSettingsCubit>(context)
                          .updatePlot(value);
                    })
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
                          Expanded(
                            child: SliderSettings(
                                defaultValue: 33,
                                min: 30,
                                max: 120,
                                loadSetting: () => 33,
                                saveSetting: (value) async =>
                                    BlocProvider
                                        .of<GameSettingsCubit>(context)
                                        .updateTime(value.toInt())
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(text: 'Продолжить', onPressed: (){
                  Navigator.pushNamed(context, '/game_lore');
                })
              ],
            ),
          ),
    );
  }
}
