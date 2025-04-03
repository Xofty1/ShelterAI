import 'package:flutter/cupertino.dart';
import 'package:shelter_ai/core/navigation/routes.dart';
import 'package:shelter_ai/domain/models/firebase_room/firebase_room.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';

import '../../domain/models/disaster.dart';
import '../../domain/models/game_state.dart';
import '../../domain/models/player.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openHome() {
    _navigator.pushNamed(RouteNames.home);
  }

  void openHomeReplacement() {
    _navigator.pushReplacementNamed(RouteNames.home);
  }

  void openSettings() {
    _navigator.pushNamed(RouteNames.settings);
  }

  void openGameSettings() {
    _navigator.pushNamed(RouteNames.gameSettings);
  }

  void openJoinScreen() {
    _navigator.pushNamed(RouteNames.joinGame);
  }

  void openOfflineGame(
      GameSettings settings, Disaster disaster, List<Player> players) {
    _navigator.pushNamed(RouteNames.game, arguments: {
      'isOnline': false,
      'settings': settings,
      'disaster': disaster,
      'players': players,
    });
  }

  void openOfflineGameReplacement(
      GameSettings settings, Disaster disaster, List<Player> players) {
    _navigator.pushReplacementNamed(RouteNames.game, arguments: {
      'isOnline': false,
      'settings': settings,
      'disaster': disaster,
      'players': players,
    });
  }

  void openOnlineGameReplacement(RunningGameState state, FirebaseRoom room){
    _navigator.pushReplacementNamed(RouteNames.game, arguments: {
      'isOnline': true,
      'state': state,
      'room': room,
    });
  }

  void pop([Object? result]) {
    _navigator.pop(result);
  }
}
