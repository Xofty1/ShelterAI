import 'package:flutter/cupertino.dart';
import 'package:shelter_ai/core/navigation/routes.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openHome() {
    _navigator.pushNamed(RouteNames.home);
  }

  void openSettings() {
    _navigator.pushNamed(RouteNames.settings);
  }

  void openGameSettings() {
    _navigator.pushNamed(RouteNames.gameSettings);
  }

  void openGame(GameSettings settings) {
    _navigator.pushNamed(RouteNames.game, arguments: [settings]);
  }

  void pop([Object? result]) {
    _navigator.pop(result);
  }
}
