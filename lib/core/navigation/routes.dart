import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/game_screen.dart';
import 'package:shelter_ai/presentation/game_settings_screen.dart';
import 'package:shelter_ai/presentation/global_settings_screen/global_settings_widget.dart';
import 'package:shelter_ai/presentation/rules_screen.dart';
import 'package:shelter_ai/presentation/shelter_home.dart';

import '../../presentation/history_screen.dart';

abstract class RouteNames {
  static const home = '/';
  static const settings = '/settings';
  static const gameSettings = 'game_settings';
  static const game = '/game';
  static const rules = '/rules';
  static const history = '/history';
}

abstract class RoutesBuilder {
  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const ShelterHome(),
          settings: settings,
        );

      case RouteNames.settings:
        return MaterialPageRoute(
          builder: (_) => const AppSettingsWidget(),
          settings: settings,
        );

      case RouteNames.gameSettings:
        return MaterialPageRoute(
          builder: (_) => const GameSettingsWidget(),
          settings: settings,
        );

      case RouteNames.game:
        return MaterialPageRoute(
          builder: (_) => const GameScreenWidget(),
          settings: settings,
        );

      case RouteNames.rules:
        return MaterialPageRoute(
          builder: (_) => const RulesScreen(),
          settings: settings,
        );

      case RouteNames.history:
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
          settings: settings,
        );

    }
    return null;
  }
}

