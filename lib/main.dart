import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shelter_ai/core/di/game_dependencies_container.dart';
import 'package:shelter_ai/core/navigation/navigation_manager.dart';
import 'package:shelter_ai/presentation/theme/theme.dart';
import 'core/navigation/routes.dart';
import 'domain/bloc/app_settings_cubit.dart';
import 'firebase_options.dart';
import 'l10n/l10n.dart';

import 'core/app_shared_preference/app_shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppSharedPreference().init();
  await dotenv.load(fileName: '.env');
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSettingsCubit(),
      child: Builder(
        builder: (context) {
          final Brightness platformBrightness =
              MediaQuery.platformBrightnessOf(context);
          final bool isSystemDark = platformBrightness == Brightness.dark;

          return BlocSelector<AppSettingsCubit, AppSettingsState, String>(
            selector: (state) => state.settings.loc,
            builder: (context, languageCode) {
              return RepositoryProvider<GameDependenciesContainer>(
                create: (context) => GameDependenciesContainer.mock(),
                child: MaterialApp(
                  locale: Locale(languageCode),
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  theme: isSystemDark
                      ? lightTheme /* <= тут заменить на darkTheme */
                      : lightTheme,
                  // Исправленная логика тем

                  initialRoute: RouteNames.home,
                  onGenerateRoute: RoutesBuilder.onGenerateRoute,
                  navigatorKey: NavigationManager.instance.key,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
