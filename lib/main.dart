import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/global_settings_screen/global_settings_widget.dart';

import 'core/app_shared_preference/app_shared_preference.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppSharedPreference().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GlobalSettingsWidget(),
    );
  }
}
