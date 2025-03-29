import 'package:flutter/material.dart';


const Color lightPrimaryColor = Color(0xFF8B5E3C);
const Color lightSecondaryColor = Color(0xFFA98274);
const Color lightBackgroundColor = Color(0xFFD3C0AA);
const Color lightSurfaceColor = Colors.white;
const Color lightOnPrimaryColor = Colors.black;
const Color lightOnSecondaryColor = Colors.white;
const Color lightOnBackgroundColor = Colors.black;
const Color lightOnSurfaceColor = Colors.black;
const Color lightActiveSwitch = Color(0xFFA38C68);

const Color darkPrimaryColor = Colors.black;
const Color darkSecondaryColor = Color(0xFF424242);
const Color darkBackgroundColor = Color(0xFF212121);
const Color darkSurfaceColor = Color(0xFF303030);
const Color darkOnPrimaryColor = Colors.white;
const Color darkOnSecondaryColor = Colors.black;
const Color darkOnBackgroundColor = Colors.white;
const Color darkOnSurfaceColor = Colors.white;
// Легкая тема приложения
ThemeData get lightTheme => ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: lightPrimaryColor,
    secondary: lightSecondaryColor,
    background: lightBackgroundColor,
    surface: lightSurfaceColor,
    onPrimary: lightOnPrimaryColor,
    onSecondary: lightOnSecondaryColor,
    onBackground: lightOnBackgroundColor,
    onSurface: lightOnSurfaceColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: lightPrimaryColor,
    foregroundColor: lightOnPrimaryColor,
  ),
  switchTheme: _switchThemeData(light: true),
  sliderTheme: _sliderThemeData(light: true),
  inputDecorationTheme: _inputDecorationTheme(light: true),
);

// Темная тема приложения
ThemeData get darkTheme => ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: darkPrimaryColor,
    secondary: darkSecondaryColor,
    background: darkBackgroundColor,
    surface: darkSurfaceColor,
    onPrimary: darkOnPrimaryColor,
    onSecondary: darkOnSecondaryColor,
    onBackground: darkOnBackgroundColor,
    onSurface: darkOnSurfaceColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkPrimaryColor,
    foregroundColor: darkOnPrimaryColor,
  ),
  switchTheme: _switchThemeData(light: false),
  sliderTheme: _sliderThemeData(light: false),
  inputDecorationTheme: _inputDecorationTheme(light: false),
);

// Настройки внешнего вида переключателя (Switch)
SwitchThemeData _switchThemeData({required bool light}) => SwitchThemeData(
  trackOutlineColor: WidgetStateProperty.all(
      light ? lightSecondaryColor : darkSecondaryColor),
  thumbColor: WidgetStateProperty.resolveWith<Color>(
        (states) => light ? lightPrimaryColor : darkOnPrimaryColor,
  ),
  trackColor: WidgetStateProperty.resolveWith<Color>(
        (states) => states.contains(WidgetState.selected)
        ? (light ? lightPrimaryColor : darkSecondaryColor)
        : (light ? Colors.white : darkSurfaceColor),
  ),
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
);

// Настройки внешнего вида ползунка (Slider)
SliderThemeData _sliderThemeData({required bool light}) => SliderThemeData(
  trackHeight: 30,
  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 13),
  overlayShape: const RoundSliderOverlayShape(overlayRadius: 13),
  activeTrackColor: light ? lightActiveSwitch : darkSecondaryColor,
  inactiveTrackColor: light ? Colors.white : darkSurfaceColor,
  thumbColor: light ? lightPrimaryColor : darkOnPrimaryColor,
  overlayColor: light ? lightPrimaryColor.withOpacity(0.5) : darkSurfaceColor.withOpacity(0.5),
  valueIndicatorColor: light ? lightSurfaceColor : darkSurfaceColor,
  valueIndicatorTextStyle: TextStyle(
    color: light ? lightOnBackgroundColor : darkOnBackgroundColor,
    fontWeight: FontWeight.bold,
  ),
);

// Настройки внешнего вида полей ввода
InputDecorationTheme _inputDecorationTheme({required bool light}) => InputDecorationTheme(
  filled: true,
  fillColor: light ? lightSurfaceColor : darkSurfaceColor,
  hintStyle: TextStyle(color: light ? lightOnBackgroundColor.withOpacity(0.5) : darkOnBackgroundColor.withOpacity(0.5)),
  contentPadding: const EdgeInsets.all(16.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: light ? lightPrimaryColor : darkSecondaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(8.0),
  ),
);
