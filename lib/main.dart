import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shelter_ai/core/navigation/navigation_manager.dart';
import 'package:shelter_ai/presentation/game_settings_screen.dart';
import 'package:shelter_ai/presentation/global_settings_screen/global_settings_widget.dart';
import 'package:shelter_ai/presentation/player_card.dart';
import 'package:shelter_ai/presentation/shelter_home.dart';
import 'package:shelter_ai/presentation/theme/theme.dart';
import 'core/navigation/routes.dart';
import 'domain/bloc/app_settings_cubit.dart';
import 'l10n/l10n.dart';

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
    return BlocProvider(
      create: (context) => AppSettingsCubit(), // Добавляем провайдер
      child: Builder(
        builder: (context) {
          final Brightness platformBrightness =
              MediaQuery.platformBrightnessOf(context);
          final bool isSystemDark = platformBrightness == Brightness.dark;

          return BlocSelector<AppSettingsCubit, AppSettingsState, String>(
            selector: (state) => state.settings.loc,
            builder: (context, languageCode) {
              return MaterialApp(
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
              );
            },
          );
        },
      ),
    );
  }
}
