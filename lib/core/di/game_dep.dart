import 'package:shelter_ai/core/di/global_dep.dart';
import '../../domain/bloc/game_bloc.dart';
import '../../domain/services/game_service.dart';

class GameDepHolder {
  GameDepContainer? _container;
  bool _isCreated = false;

  GameDepContainer? get container => _container;
  bool get isCreated => _isCreated;

  void create(GlobalDepContainer globalDepContainer) {
    _container = GameDepContainer.inject(globalDepContainer);
    _isCreated = true;
  }

  void dispose() {
    if (_container != null) {
      _container!.dispose();
      _container = null;
    }
    _isCreated = false;
  }
}

class GameDepContainer {
  final GameService service;
  final GameBloc gameBloc;

  void dispose() {
    gameBloc.close();
  }

  GameDepContainer._({required this.service, required this.gameBloc});

  factory GameDepContainer.inject(GlobalDepContainer container) {
    GameService service = GameService(container.gptRepository);
    GameBloc gameBloc = GameBloc(service);

    return GameDepContainer._(service: service, gameBloc: gameBloc);
  }
}
