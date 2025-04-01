import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/bloc/game_bloc.dart';
import '../domain/models/disaster.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_app.dart';

import '../l10n/l10n.dart';

class LoreScreen extends StatelessWidget {
  final Disaster disaster;

  const LoreScreen({super.key, required this.disaster});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ScaffoldApp(
      name: loc.lore,
      child: Column(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.6313725490196078),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFCCC6C1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                  disaster.name,
                                style: const TextStyle(fontSize: 32, color: Colors.black),
                              ),
                              Text(
                                disaster.description,
                                style: const TextStyle(fontSize: 24, color: Colors.black),
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                disaster.disasterDescription,
                                style: const TextStyle(fontSize: 24, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(text: loc.pause, onPressed: (){}),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.circle_notifications, size: 48),
                        color: const Color(0xFFA8906B),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          AppButton(text: loc.startGame, onPressed: (){
            // Navigator.pushNamed(context, '/game_round');
            BlocProvider.of<GameBloc>(context).add(ReadyGameEvent());
          })
        ],
      ),

    );
  }
}

//
// class LoreScreen extends StatelessWidget {
//   final Disaster disaster;
//
//   const LoreScreen({super.key, required this.disaster});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF6B523A),
//       body: Stack(
//         children: [
//           Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               height: MediaQuery.of(context).size.height * 0.73,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFD6D1CC),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color(0xFFCCC6C1),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: SingleChildScrollView(
//                           padding: const EdgeInsets.all(10),
//                           child: Text(
//                             disaster.name,
//                             style: const TextStyle(fontSize: 32, color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFFA8906B),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: const Text(
//                           'Пауза',
//                           style: TextStyle(color: Colors.black, fontSize: 32),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: (){},
//                         icon: Icon(Icons.circle, size: 32,),
//                         color: Color(0xFFA8906B),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Positioned(
//             bottom: 55,
//             left: MediaQuery.of(context).size.width * 0.15,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFFA8906B),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               onPressed: () {
//                 BlocProvider.of<GameBloc>(context).add(ReadyGameEvent());
//                 // Navigator.pushNamed(context, '/player_card');
//               },
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                 child: Text(
//                   'Начать игру',
//                   style: TextStyle(color: Colors.black, fontSize: 32),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//               top: 60,
//               left: 20,
//               child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.arrow_back, size: 48),
//                   color: Colors.white
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }