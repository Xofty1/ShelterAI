import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadAppFonts();
  await testMain();
}

// Этот метод можно использовать для тестирования любого виджета
Future<void> testGoldenWidget(
  WidgetTester tester, 
  Widget widget, 
  String fileName,
  { 
    Size? size,
    BoxConstraints constraints = const BoxConstraints(maxWidth: 400),
  }
) async {
  // Установка размера виджета для тестов
  final wrappedWidget = size != null
      ? SizedBox(width: size.width, height: size.height, child: widget)
      : ConstrainedBox(constraints: constraints, child: widget);

  // Оборачиваем в MaterialApp для правильного рендеринга
  final materialApp = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: wrappedWidget,
      ),
    ),
  );

  await tester.pumpWidget(materialApp);
  await screenMatchesGolden(tester, fileName);
}

/// Общая настройка для всех golden тестов
Future<void> setupGoldenTests() async {
  // Загрузка шрифтов через golden_toolkit
  await loadAppFonts();

  // Настройка сравнения golden-файлов с допустимым отклонением
  goldenFileComparator = LocalFileComparator(Uri.parse('test/goldens/'));
}

/// Настройка для конкретного теста
void setupGoldenTest() {
  // Установка фиксированных размеров и соотношения пикселей
  final testWidgetsFlutterBinding = TestWidgetsFlutterBinding.ensureInitialized();
  testWidgetsFlutterBinding.window.physicalSizeTestValue = const Size(1024, 768);
  testWidgetsFlutterBinding.window.devicePixelRatioTestValue = 1.0;
}

/// Типовые разрешения устройств для тестирования
final Map<String, Size> deviceScreenSizes = {
  'mobile-small': const Size(320, 568),   // iPhone SE
  'mobile-medium': const Size(375, 812),  // iPhone X/11/12
  'mobile-large': const Size(428, 926),   // iPhone 13 Pro Max
  'tablet-small': const Size(768, 1024),  // iPad
  'tablet-large': const Size(1024, 1366), // iPad Pro
  'desktop': const Size(1440, 900),       // Типичный ноутбук
}; 