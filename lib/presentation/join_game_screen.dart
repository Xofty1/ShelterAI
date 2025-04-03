import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/domain/bloc/join_game_cubit.dart';
import 'package:shelter_ai/presentation/loader_screen.dart';
import '../core/navigation/navigation_manager.dart';
import '../domain/bloc/game_settings_cubit.dart';
import 'ui_items/app_button.dart';
import 'ui_items/scaffold_template.dart';

class JoinGameScreen extends StatefulWidget {
  const JoinGameScreen({super.key});

  @override
  State<JoinGameScreen> createState() => _JoinGameScreenState();
}

class _JoinGameScreenState extends State<JoinGameScreen> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoinGameCubit(),
      child: BlocListener<JoinGameCubit, JoinGameState>(
        listener: (context, state) {
          if (state is SuccessJoinedState) {
            // Navigate to the game screen
            NavigationManager.instance
                .openOnlineGameReplacement(state.gameState, state.room);
          } else if (state is ErrorJoinState) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: BlocBuilder<JoinGameCubit, JoinGameState>(
          builder: (context, state) {
            if (state is LoadingJoinState) {
              return const LoaderScreen();
            }

            return ScaffoldTemplate(
              name: 'Присоединиться к игре',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Введите пароль для присоединения',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Введите пароль',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Присоединиться',
                    onPressed: () => BlocProvider.of<JoinGameCubit>(context)
                        .joinGame(_passwordController.text),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
