import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/game_settings_screen.dart';
import 'package:shelter_ai/presentation/global_settings_screen/global_settings_widget.dart';
import 'package:shelter_ai/presentation/shelter_home.dart';

abstract class RouteNames {
  static const home = '/';
  static const settings = '/settings';
  static const gameSettings = 'game_settings';
  static const game = '/game';
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
        // TODO: Вставить экран с игрой
        return MaterialPageRoute(
          builder: (_) => const Center(),
          settings: settings,
        );
    }
    return null;
  }
}
