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