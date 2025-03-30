import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';
import 'package:shelter_ai/presentation/ui_items/scaffold_app.dart';

class LoreScreen extends StatelessWidget {
  const LoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      name: 'Lore',
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
                          child: const SingleChildScrollView(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n'
                                  'Здесь будет текст...\n',
                              style: TextStyle(fontSize: 32, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(text: "Pause", onPressed: (){}),
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
            SizedBox(height: 20),
            AppButton(text: "Start game", onPressed: (){
              Navigator.pushNamed(context, '/game_round');
            })
          ],
        ),

      );
  }
}