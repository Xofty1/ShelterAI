import 'package:flutter/material.dart';
import 'package:shelter_ai/presentation/global_settings_screen/global_settings_widget.dart';
import 'package:shelter_ai/presentation/shelter_home.dart';
import 'package:shelter_ai/presentation/theme/theme.dart';

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
    final Brightness platformBrightness = MediaQuery.platformBrightnessOf(context);
    final bool isSystemDark = platformBrightness == Brightness.dark;
    return MaterialApp(
      theme: isSystemDark ? lightTheme /* <= тут заменить на darkTheme */ : lightTheme,
      routes: {
        '/': (context) => const ShelterHome(),
        '/settings': (context) => const GlobalSettingsWidget()
      },
      initialRoute: '/',
    );
  }
}
