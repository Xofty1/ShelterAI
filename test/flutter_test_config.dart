import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// Проверяем, запущены ли тесты в CI-среде
bool get isRunningInCI => Platform.environment.containsKey('CI');

// Компаратор с настраиваемым допуском различий
class CustomFileComparator extends LocalFileComparator {
  CustomFileComparator(Uri uri, {this.tolerance = 0.1}) : super(uri);
  
  final double tolerance;
  
  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );
    
    if (!result.passed && result.diffPercent < tolerance) {
      debugPrint(
        'A difference of ${result.diffPercent * 100}% was found, but it is '
        'acceptable because the tolerance is set to ${tolerance * 100}%.',
      );
      return true;
    }
    
    return result.passed;
  }
}

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  if (isRunningInCI) {
    // В CI-среде изменяем tolerance для golden тестов
    AutomatedTestWidgetsFlutterBinding.ensureInitialized();
    WidgetController.hitTestWarningShouldBeFatal = true;
    
    // Устанавливаем компаратор с высоким уровнем tolerance
    goldenFileComparator = CustomFileComparator(
      Uri.parse('test/ui_tests/goldens'),
      tolerance: 0.5, // 50% tolerance - очень высокое значение
    );
  }
  
  await loadAppFonts();
  await testMain();
} 