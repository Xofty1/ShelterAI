import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/game_lore_screen.dart';
import 'package:shelter_ai/presentation/game_round_screen.dart';
import 'package:shelter_ai/presentation/game_settings_screen.dart';
import 'package:shelter_ai/presentation/global_settings_screen/global_settings_widget.dart';
import 'package:shelter_ai/presentation/player_card_screen.dart';
import 'package:shelter_ai/presentation/players_list_screen.dart';
import 'package:shelter_ai/presentation/shelter_home.dart';
import 'package:shelter_ai/presentation/theme/theme.dart';

import 'core/app_shared_preference/app_shared_preference.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppSharedPreference().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness platformBrightness = MediaQuery.platformBrightnessOf(context);
    final bool isSystemDark = platformBrightness == Brightness.dark;
    return MaterialApp(
      theme: isSystemDark ? lightTheme /* <= тут заменить на darkTheme */ : lightTheme,
      routes: {

        //'/': (context) =>  LoreScreen(),
        '/': (context) => const ShelterHome(),
        '/settings': (context) => const GlobalSettingsWidget(),
        '/game_settings': (context) => const GameSettingsWidget(),
        '/game_lore': (context) => const LoreScreen(),
        '/game_round': (context) =>  const GameRoundScreen(
            roundCount: '3',
          alivePlayerCount: '6',
          deadPlayerCount: '2',
          showCharacteristicCount: '2',
          needToKickCount: '3',
        ),
        '/players_list': (context) => const PlayersListScreen(),
        '/player_card': (context) => const PlayerCardScreen(),
      },
      initialRoute: '/',
    );
  }
}


