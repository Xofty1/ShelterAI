import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String text;

  const LabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE0D4), // Светлый бежевый цвет
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B4F35), // Коричневый цвет текста
          ),
        ),
      ),
    );
  }
}
