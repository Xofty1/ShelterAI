import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shelter_ai/presentation/ui_items/button.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  final Map<String, Size> deviceScreenSizes = {
    'mobile-small': const Size(320, 568),   // iPhone SE
    'mobile-medium': const Size(375, 812),  // iPhone X/11/12
    'mobile-large': const Size(428, 926),   // iPhone 13 Pro Max
    'tablet-small': const Size(768, 1024),  // iPad
    'tablet-large': const Size(1024, 1366), // iPad Pro
  };

  group('CustomButton Golden Tests', () {
    testGoldens('CustomButton renders correctly', (tester) async {
      await tester.pumpWidgetBuilder(
        MaterialApp(
          theme: ThemeData(
            fontFamily: 'Roboto',
            textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
              bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          home: Scaffold(
            body: Center(
              child: CustomButton(
                text: 'Тестовая кнопка',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(CustomButton),
        matchesGoldenFile('goldens/custom_button.png'),
      );
    });


    testGoldens('CustomButton renders correctly on different devices', (tester) async {
      for (final deviceEntry in deviceScreenSizes.entries) {
        await tester.binding.setSurfaceSize(deviceEntry.value);
        
        await tester.pumpWidgetBuilder(
          MaterialApp(
            theme: ThemeData(
              fontFamily: 'Roboto',
              textTheme: const TextTheme(
                bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
                bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            home: Scaffold(
              body: Center(
                child: CustomButton(
                  text: 'Кнопка на ${deviceEntry.key}',
                  onPressed: () {},
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(CustomButton),
          matchesGoldenFile('goldens/custom_button_${deviceEntry.key}.png'),
        );
      }
    });
  });
} 