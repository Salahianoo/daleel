import 'package:daleel/features/Language/presentation/pages/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'core/language/language_cubit.dart';
import 'splash_screen.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/get_current_user_usecase.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/presentation/pages/main_screen.dart';
import 'features/advertisement/presentation/pages/ad_main_screen.dart';
import 'features/auth/presentation/pages/profile_page.dart';
import 'features/settings/presentation/pages/settings_screen.dart';
import 'features/help/presentation/pages/help_screen.dart';
import 'features/about/presentation/pages/about_screen.dart';

void main() {
  final authRemoteDataSource = AuthRemoteDataSource();
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            loginUseCase: LoginUseCase(authRepository),
            logoutUseCase: LogoutUseCase(authRepository),
            getCurrentUserUseCase: GetCurrentUserUseCase(authRepository),
          ),
        ),
        BlocProvider(create: (context) => LanguageCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // ignore: use_super_parameters
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, languageState) {
        print('Building app with locale: ${languageState.locale.languageCode}');
        print(
          'Building app with text direction: ${languageState.textDirection}',
        );
        return Directionality(
          textDirection: languageState.textDirection,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // Localization settings
            supportedLocales: const [
              Locale('ar'), // Arabic
              Locale('en'), // English
            ],
            locale: languageState.locale, // Use dynamic locale from cubit
            localeResolutionCallback: (locale, supportedLocales) {
              // Return the current locale from cubit if supported
              if (supportedLocales.any(
                (supportedLocale) =>
                    supportedLocale.languageCode == locale?.languageCode,
              )) {
                return locale;
              }
              // Fallback to Arabic if not supported
              return const Locale('ar');
            },
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const SplashScreen(),
            routes: {
              '/home': (context) => const HomeScreen(),
              '/announcements': (context) => const PlansScreen(),
              '/guide': (context) => const LanguageScreen(),
              '/profile': (context) => const ProfilePage(),
              '/settings': (context) => const SettingsScreen(),
              '/help': (context) => const HelpScreen(),
              '/about': (context) => const AboutScreen(),
            },
          ),
        );
      },
    );
  }
}
