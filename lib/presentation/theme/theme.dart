import 'package:flutter/material.dart';

// Легкая тема приложения (для светлого режима)
ThemeData get lightTheme => ThemeData(
  brightness: Brightness.light, // Устанавливает яркость на светлую (по умолчанию для светлой темы)
  primaryColor: Colors.brown, // Основной цвет приложения (цвет на панелях, кнопках и т. д.)
  scaffoldBackgroundColor: const Color(0xFFD3C0AA), // Цвет фона для основного экрана (scaffold)
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.brown, // Цвет фона для AppBar (верхней панели)
    foregroundColor: Colors.black, // Цвет текста и иконок на AppBar
  ),
  switchTheme: _switchThemeData(), // Настройки внешнего вида переключателя (Switch)
  sliderTheme: _sliderThemeData(), // Настройки внешнего вида ползунка (Slider)
);

// Тема для темного режима
ThemeData get darkTheme => ThemeData(
  brightness: Brightness.dark, // Устанавливает яркость на темную (по умолчанию для темной темы)
  primaryColor: Colors.black, // Основной цвет приложения (черный для темной темы)
  scaffoldBackgroundColor: Colors.grey[900], // Темный фон для основного экрана
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black, // Цвет фона для AppBar в темной теме
    foregroundColor: Colors.white, // Цвет текста и иконок на AppBar в темной теме
  ),
);

// Настройка внешнего вида переключателя (Switch)
SwitchThemeData _switchThemeData() {
  return SwitchThemeData(
    trackOutlineColor: WidgetStateProperty.all(const Color(0xA38C6800)),
    thumbColor: WidgetStateProperty.resolveWith<Color>( // Цвет "ползунка" переключателя
          (states) => const Color(0xFF564200), // Когда переключатель включен, его цвет
    ),
    trackColor: WidgetStateProperty.resolveWith<Color>( // Цвет полоски, по которой двигается ползунок
          (states) => states.contains(WidgetState.selected)
          ? const Color(0xA38C6800) // Когда переключатель включен
          : Colors.white, // Когда переключатель выключен
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Размер области нажатия для Switch
  );
}

// Настройка внешнего вида ползунка (Slider)
SliderThemeData _sliderThemeData() {
  return const SliderThemeData(
    trackHeight: 30, // Высота дорожки ползунка
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13), // Форма и размер ползунка
    overlayShape: RoundSliderOverlayShape(overlayRadius: 13), // Форма и размер оверлея при нажатии
    activeTrackColor: Color(0xA38C6800), // Цвет активной дорожки ползунка
    inactiveTrackColor: Colors.white, // Цвет неактивной дорожки ползунка
    thumbColor: Color(0x6B564200), // Цвет самого ползунка
    overlayColor: Color(0x6B564200), // Цвет оверлея ползунка
    valueIndicatorColor: Colors.white, // Цвет индикатора значения
    valueIndicatorTextStyle: TextStyle(
      color: Colors.black, // Цвет текста в индикаторе
      fontWeight: FontWeight.bold, // Жирный шрифт для текста в индикаторе
    ),
  );
}
