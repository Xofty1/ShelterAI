import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/bloc/game_bloc.dart';
import '../domain/models/disaster.dart';

class LoreScreen extends StatelessWidget {
  final Disaster disaster;

  const LoreScreen({super.key, required this.disaster});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6B523A),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.73,
              decoration: BoxDecoration(
                color: const Color(0xFFD6D1CC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFCCC6C1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            disaster.name,
                            style: const TextStyle(fontSize: 32, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA8906B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Пауза',
                          style: TextStyle(color: Colors.black, fontSize: 32),
                        ),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.circle, size: 32,),
                        color: Color(0xFFA8906B),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Positioned(
            bottom: 55,
            left: MediaQuery.of(context).size.width * 0.15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA8906B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                BlocProvider.of<GameBloc>(context).add(ReadyGameEvent());
                // Navigator.pushNamed(context, '/player_card');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Начать игру',
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
              ),
            ),
          ),
          Positioned(
              top: 60,
              left: 20,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back, size: 48),
                  color: Colors.white
              )
          ),
        ],
      ),
    );
  }
}