import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/ui_items/player_card_voting.dart';

class FinishScreen extends StatelessWidget {

  final int alivePlayers;
  final int deadPlayers;

  const FinishScreen({
    super.key,
    required this.alivePlayers,
    required this.deadPlayers
  });

  @override
  Widget build(BuildContext context) {


    const headerColor = Color(0xFFB8A876);
    const headerTextColor = Color(0xFF482020);
    const buttonColor = Color(0xFF99582A);
    const aliveTitleColor = Color(0xFFD7BC91);
    const avileTitleTextColor = Color(0xFF432818);
    const deadTextColor = Color(0xFFE9E1DD);
    const deadTitleColor = Color(0xFF6E5227);


    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6B5642), Color(0xFFD1A881)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  color: headerColor,
                  child: const Center(
                    child: Text(
                      'ФИНАЛ',
                      style: TextStyle(
                          color: headerTextColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA38C68),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(

                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                      child: Container(
                      padding: const EdgeInsets.all(12),
                                child: const SingleChildScrollView(
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
                        style: TextStyle(fontSize: 16),
                      ),
                                ),
                              ),
                    ),
                  ),
                ),
              ),

          const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  color: aliveTitleColor,
                  child: const Center(
                    child: Text(
                      'В бункер попали:',
                      style: TextStyle(
                          color: avileTitleTextColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

          const SizedBox(height: 8),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  children: List.generate(alivePlayers, (index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PlayerCardVoting(
                            number: (index + 1).toString(),
                            name: 'Игрок ${index + 1}',
                            profession: 'Профессия ${index + 1}',
                          ),
                        ),
                      ],
                    );
                  }),
                ),

          const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  color: deadTitleColor,
                  child: const Center(
                    child: Text(
                      'Не спаслись:',
                      style: TextStyle(
                          color: deadTextColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

          const SizedBox(height: 8),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  children: List.generate(deadPlayers, (index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PlayerCardVoting(
                            number: (index + 1).toString(),
                            name: 'Игрок ${index + 1}',
                            profession: 'Профессия ${index + 1}',
                          ),
                        ),
                      ],
                    );
                  }),
                ),

          const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        disabledBackgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Завершить',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
          ],
              ),
              ),
        ),
      ),
    );
  }
}
