import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/core/di/game_dep.dart';
import 'package:shelter_ai/core/di/game_settings_dep.dart';
import 'package:shelter_ai/core/di/global_dep.dart';
import 'package:shelter_ai/domain/bloc/game_settings_cubit.dart';
import 'package:shelter_ai/presentation/game_screen.dart';

class RoomJoinScreen extends StatefulWidget {
  static const String routeName = '/room-join';

  const RoomJoinScreen({Key? key}) : super(key: key);

  @override
  State<RoomJoinScreen> createState() => _RoomJoinScreenState();
}

class _RoomJoinScreenState extends State<RoomJoinScreen> {
  final TextEditingController _roomIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GameSettingsDepHolder gameSettingsDepHolder = GameSettingsDepHolder();
  final GameDepHolder gameDepHolder = GameDepHolder();

  @override
  void initState() {
    super.initState();
    final globalDepContainer = GlobalDepContainer.instance;
    gameSettingsDepHolder.create(globalDepContainer);
  }

  @override
  void dispose() {
    _roomIdController.dispose();
    _passwordController.dispose();
    gameSettingsDepHolder.dispose();
    gameDepHolder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Room'),
      ),
      body: BlocProvider(
        create: (_) => gameSettingsDepHolder.container!.gameSettingsCubit,
        child: BlocListener<GameSettingsCubit, GameSettingsState>(
          listener: (context, state) {
            if (state is JoinedRoomState) {
              // Initialize GameBloc with the room data
              gameDepHolder.create(
                GlobalDepContainer.instance,
                roomId: state.roomId,
                isHost: false,
                playerId: state.currentPlayer.id.toString(),
              );

              // Navigate to game screen
              Navigator.of(context).pushReplacementNamed(
                GameScreen.routeName,
              );
            } else if (state is RoomNotFoundState) {
              _showErrorSnackBar('Room not found');
            } else if (state is InvalidPasswordState) {
              _showErrorSnackBar('Invalid password');
            } else if (state is RoomFullState) {
              _showErrorSnackBar('Room is full');
            } else if (state is ErrorJoiningRoomState) {
              _showErrorSnackBar('Error joining room');
            }
          },
          child: BlocBuilder<GameSettingsCubit, GameSettingsState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _roomIdController,
                      decoration: const InputDecoration(
                        labelText: 'Room ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: state is JoiningRoomState
                          ? null
                          : () => _joinRoom(context),
                      child: state is JoiningRoomState
                          ? const CircularProgressIndicator()
                          : const Text('Join Room'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _joinRoom(BuildContext context) {
    final roomId = _roomIdController.text.trim();
    final password = _passwordController.text.trim();

    if (roomId.isEmpty || password.isEmpty) {
      _showErrorSnackBar('Please enter room ID and password');
      return;
    }

    BlocProvider.of<GameSettingsCubit>(context).joinRoom(roomId, password);
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
