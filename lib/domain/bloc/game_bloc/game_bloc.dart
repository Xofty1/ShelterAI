import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/round_info.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../../models/game_state.dart';
import 'game_bloc_event.dart';
import 'game_bloc_state.dart';

class GameBloc extends Bloc<GameEvent, GameBlocState>{

  final GPTRepository repository;

  GameBloc(this.repository) : super(GameLoadingState()) {
    on<StartedGameEvent>(_onGameStarted);
    on<RoundFinishedGameEvent>(_onRoundStarted);
  }

  _onGameStarted(StartedGameEvent event, Emitter emit) async {
    emit(GameLoadingState());

    final disaster = await repository.getDisaster(event.settings);
    final players = await repository.getPlayers(event.settings);
    const roundInfo = RoundInfo(
        roundNumber: 0,
        kickedCount: 0,
        openCount: 0
    );

    emit(GameRunningState(
        gameState: GameState(
            settings: event.settings, 
            disaster: disaster,
            players: players,
            stage: GameStage.intro,
            roundInfo: roundInfo,
            actionsTaken: 0,
            currentPlayerIndex: 0,
        )
    ));
  }

  // TODO: Проверка на окончание игры
  _onRoundStarted(RoundFinishedGameEvent event, Emitter emit){
    var roundNumber = (state as GameRunningState).gameState.roundInfo.roundNumber;
    var playersCount = (state as GameRunningState).gameState.settings.playersCount;

    RoundInfo newRoundInfo = getRoundInfo(roundNumber + 1, playersCount);

    var currentPlayerIndex = (state as GameRunningState).gameState.players
        .indexWhere((element) => element.lifeStatus == LifeStatus.alive);

    emit(
      GameRunningState(gameState: (state as GameRunningState).gameState.copyWith(
        stage: GameStage.roundStarted,
        roundInfo: newRoundInfo,
        currentPlayerIndex: currentPlayerIndex,
        actionsTaken: 0,
      ))
    );
  }



}




