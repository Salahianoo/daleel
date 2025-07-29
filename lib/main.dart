import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_screen.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/get_current_user_usecase.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/presentation/pages/main_screen.dart';
import 'features/advertisement/presentation/pages/ad_main_screen.dart';
import 'features/guide/presentation/pages/guide_screen.dart';
import 'features/auth/presentation/pages/profile_page.dart';
import 'features/settings/presentation/pages/settings_screen.dart';
import 'features/help/presentation/pages/help_screen.dart';
import 'features/about/presentation/pages/about_screen.dart';

void main() {
  final authRemoteDataSource = AuthRemoteDataSource();
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);
  runApp(
    MyApp(
      authCubit: AuthCubit(
        loginUseCase: LoginUseCase(authRepository),
        logoutUseCase: LogoutUseCase(authRepository),
        getCurrentUserUseCase: GetCurrentUserUseCase(authRepository),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthCubit authCubit;
  // ignore: use_super_parameters
  const MyApp({Key? key, required this.authCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authCubit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/announcements': (context) => const PlansScreen(),
          '/guide': (context) => const GuideScreen(),
          '/profile': (context) => const ProfilePage(),
          '/settings': (context) => const SettingsScreen(),
          '/help': (context) => const HelpScreen(),
          '/about': (context) => const AboutScreen(),
        },
      ),
    );
  }
}
