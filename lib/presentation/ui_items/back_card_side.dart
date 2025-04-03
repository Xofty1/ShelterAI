import 'package:flutter/material.dart';

import 'asset_image_item.dart';

class PlayerCardBack extends StatelessWidget {
  const PlayerCardBack({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageItem(
          imagePath: "assets/images/door.svg",
          width: 200,
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          "Нажмите, чтобы увидеть карту игрока",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}