import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/app_localizations.dart';
import 'routes/app_routes.dart';
import 'theme/theme_cubit.dart';
import 'theme/app_themes.dart';
import '../core/language/language_cubit.dart';

class AppConfig {
  static const String appName = 'Daleel';
  static const String appVersion = '0.1.0';

  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('ar'), // Arabic
    Locale('en'), // English
  ];

  // Localization delegates
  static const List<LocalizationsDelegate> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // Locale resolution callback
  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    // Return the current locale if supported
    if (supportedLocales.any(
      (supportedLocale) => supportedLocale.languageCode == locale?.languageCode,
    )) {
      return locale;
    }
    // Fallback to Arabic if not supported
    return const Locale('ar');
  }

  // Material app configuration
  static Widget createApp(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, languageState) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return Directionality(
              textDirection: languageState.textDirection,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: appName,

                // Theme configuration
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: themeState == ThemeState.dark
                    ? ThemeMode.dark
                    : ThemeMode.light,

                // Localization configuration
                supportedLocales: supportedLocales,
                locale: languageState.locale,
                localeResolutionCallback: localeResolutionCallback,
                localizationsDelegates: localizationsDelegates,

                // Navigation configuration
                initialRoute: AppRoutes.splash,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              ),
            );
          },
        );
      },
    );
  }
}
