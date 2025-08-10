import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/main_screen.dart';
import '../../features/advertisement/presentation/pages/ad_main_screen.dart';
import '../../features/Language/presentation/pages/language_screen.dart';
import '../../features/auth/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/settings_screen.dart';
import '../../features/help/presentation/pages/help_screen.dart';
import '../../features/about/presentation/pages/about_screen.dart';
import '../../features/location/presentation/pages/location_google.dart';
import '../../splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String announcements = '/announcements';
  static const String guide = '/guide';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String help = '/help';
  static const String about = '/about';
  static const String location = '/location';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      home: (context) => const HomeScreen(),
      announcements: (context) => const PlansScreen(),
      guide: (context) => const LanguageScreen(),
      profile: (context) => const ProfilePage(),
      settings: (context) => const SettingsScreen(),
      help: (context) => const HelpScreen(),
      about: (context) => const AboutScreen(),
      location: (context) => const MapScreen(),
    };
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.announcements:
        return MaterialPageRoute(builder: (_) => const PlansScreen());
      case AppRoutes.guide:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoutes.help:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case AppRoutes.about:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case AppRoutes.location:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
