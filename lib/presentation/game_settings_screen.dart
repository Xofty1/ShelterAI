// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shelter_ai/domain/bloc/game_settings_cubit.dart';
//
// class GameSettingsScreen extends StatelessWidget {
//   const GameSettingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(create: (context) => GameSettingsCubit(), child: const ChildBlocWidget(),),
//     );
//   }
//
// }
//
// class ChildBlocWidget extends StatelessWidget{
//   const ChildBlocWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GameSettingsCubit, GameSettingsState>(builder: (context, state) => Column(
//       children: [
//         TextField(
//             onChanged: (value) =>
//             {
//               BlocProvider
//                   .of<GameSettingsCubit>(context)
//                   .updatePlot(value),
//             }
//         ),
//         Text(state.settings.plot)
//       ],
//     ));
//   }
// }