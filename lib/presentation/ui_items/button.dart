import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isMuted;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.isMuted = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF8B6F55), // Темный коричневый обводки
          width: 6,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF8B6F55), // Тень под кнопкой
            offset: Offset(3, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD9C08D), // Основной цвет кнопки
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 0,
        ),
        onPressed: isMuted ? null : onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7A5E3E),
          ),
        ),
      ),
    );
  }
}
