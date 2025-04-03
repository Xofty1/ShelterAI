import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/models/firebase_room/firebase_room.dart';

import '../../data/repositories/firebase_repository.dart';
import '../models/game_state.dart';

class JoinGameCubit extends Cubit<JoinGameState>{
  JoinGameCubit() : super(const JoinGameState());

  // TODO: DI
  FirebaseRepository firebaseRepository = FirebaseRepository();

  Future<void> joinGame(String roomId) async {
    try {
      // Get room data
      final room = await firebaseRepository.getRoom(roomId);
      if (room == null) {
        emit(const ErrorJoinState(errorMessage: "Комната не найдена"));
        return;
      } else {
        final playerId = await firebaseRepository.joinRoom(roomId);
        // это id игрока под которым играет пользователь
        emit(SuccessJoinedState(
          room: FirebaseRoom(
            isHost: true,
            playerId: playerId,
            roomId: roomId,
          ),
          gameState: room.gameState,
        ));
      }

      // Get current players
      final players = await firebaseRepository.getPlayers(roomId);

    } catch (e) {
      print("joinGame $e");
      emit(const ErrorJoinState(errorMessage: 'Ошибка при подключении к комнате'));
    }
  }
}

class JoinGameState {
  const JoinGameState();
}

class WaitingState extends JoinGameState {
  const WaitingState();
}

class LoadingJoinState extends JoinGameState {
  const LoadingJoinState();
}

class ErrorJoinState extends JoinGameState {
  final String errorMessage;
  const ErrorJoinState({required this.errorMessage});
}

class SuccessJoinedState extends JoinGameState {
  final RunningGameState gameState;
  final FirebaseRoom room;

  const SuccessJoinedState({required this.room, required this.gameState});
}