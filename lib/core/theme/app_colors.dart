import 'package:flutter/material.dart';

class AppColors {
  // Основные цвета
  static const Color primary = Color(0xFF6B5642);
  static const Color secondary = Color(0xFFD1A881);
  static const Color accent = Color(0xFFB8A876);

  // Цвета текста
  static const Color textPrimary = Color(0xFF482020);
  static const Color textSecondary = Color(0xFF654E32);
  static const Color textLight = Color(0xFFD6C7B0);

  // Цвета карточек
  static const Color cardBackground = Color(0xFFD6C7B0);
  static const Color cardAccent = Color(0xFFBFAA8F);
  static const Color cardIcon = Color(0xFF523418);

  // Цвета кнопок
  static const Color buttonBackground = Color(0xFFBAA17A);
  static const Color buttonText = Colors.black;

  // Цвета теней
  static const Color shadow = Color(0xFF8B6F55);

  // Градиенты
  static const LinearGradient mainGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
