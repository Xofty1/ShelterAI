import 'package:flutter/material.dart';

class LoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6B523A),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.73,
              decoration: BoxDecoration(
                color: Color(0xFFD6D1CC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                        child: Text(
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
          SizedBox(height: 20),
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
              onPressed: () {},
              child: Padding(
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
