import 'package:flutter/material.dart';

import 'asset_image_item.dart';

class PlayerCardBack extends StatelessWidget {

  final int currentIndex;

  const PlayerCardBack({
    super.key,
    required this.currentIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
                currentIndex.toString(),
              style: const TextStyle(
                color: Color(0xFF9E4A42),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
              ),
        ),
      ),
        const SizedBox(height: 110),
        const AssetImageItem(
          imagePath: "assets/images/door.svg",
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 24),
        const Text(
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