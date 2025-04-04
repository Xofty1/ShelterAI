import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String text;
  final Color color;

  const LabelWidget({super.key, required this.text, this.color = const Color(0xFFEDE0D4)});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B4F35),
          ),
          softWrap: true, // Позволяет переносу строки
          overflow: TextOverflow.visible, // Позволяет тексту расширяться вниз
        ),
      ),
    );
  }
}
