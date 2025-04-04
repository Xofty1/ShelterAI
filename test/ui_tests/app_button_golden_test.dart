import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';
import 'dart:io';
import 'golden_test_helper.dart';

bool get isRunningInCI => Platform.environment.containsKey('CI');

void main() {
  group('AppButton Golden Tests', () {
    testGoldens('AppButton renders correctly', (WidgetTester tester) async {
      if (isRunningInCI) {
        return;
      }
      
      await testGoldenWidget(
        tester,
        AppButton(
          text: 'Нажми меня',
          onPressed: () {},
        ),
        'app_button_default',
      );
    }, tags: ['golden']);

    testGoldens('AppButton renders with long text', (WidgetTester tester) async {
      if (isRunningInCI) {
        return;
      }
      
      await testGoldenWidget(
        tester,
        AppButton(
          text: 'Это очень длинный текст для кнопки, чтобы проверить перенос',
          onPressed: () {},
        ),
        'app_button_long_text',
      );
    }, tags: ['golden']);

    testGoldens('AppButton with different sizes', (WidgetTester tester) async {
      if (isRunningInCI) {
        return;
      }
      
      await testGoldenWidget(
        tester,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              text: 'Маленькая',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: AppButton(
                text: 'Широкая кнопка',
                onPressed: () {},
              ),
            ),
          ],
        ),
        'app_button_sizes',
        size: const Size(400, 300),
      );
    }, tags: ['golden']);
  });
} 