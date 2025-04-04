import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

bool get isRunningInCI => Platform.environment.containsKey('CI');

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
    AutomatedTestWidgetsFlutterBinding.ensureInitialized();
    WidgetController.hitTestWarningShouldBeFatal = true;
    
    goldenFileComparator = CustomFileComparator(
      Uri.parse('test/ui_tests/goldens'),
      tolerance: 0.5,
    );
  }
  
  await loadAppFonts();
  await testMain();
} 