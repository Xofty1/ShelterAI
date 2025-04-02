import 'package:flutter/cupertino.dart';
import 'package:shelter_ai/core/navigation/routes.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';

import '../../domain/models/disaster.dart';
import '../../domain/models/player.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openHome() {
    _navigator.pushNamed(RouteNames.home);
  }

  void openHomeReplacment() {
    _navigator.pushReplacementNamed(RouteNames.home);
  }

  void openSettings() {
    _navigator.pushNamed(RouteNames.settings);
  }

  void openGameSettings() {
    _navigator.pushNamed(RouteNames.gameSettings);
  }

  void openGame(
      GameSettings settings, Disaster disaster, List<Player> players) {
    _navigator.pushNamed(RouteNames.game, arguments: {
      'settings': settings,
      'disaster': disaster,
      'players': players,
    });
  }

  void pop([Object? result]) {
    _navigator.pop(result);
  }
}
