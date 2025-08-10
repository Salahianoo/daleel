import 'package:flutter/material.dart';

class NavigationService {
  static void navigateToPage(
    BuildContext context,
    String routeName, {
    bool replacement = true,
  }) {
    Navigator.pop(context); // Close drawer first

    if (replacement) {
      Navigator.pushReplacementNamed(context, routeName);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }

  static String getCurrentRoute(BuildContext context) {
    return ModalRoute.of(context)?.settings.name ?? '/';
  }

  static String getPageNameFromRoute(String route) {
    switch (route) {
      case '/':
      case '/home':
        return 'home';
      case '/guide':
        return 'guide';
      case '/location':
        return 'location';
      case '/announcements':
        return 'announcements';
      case '/profile':
        return 'profile';
      case '/settings':
        return 'settings';
      case '/help':
        return 'help';
      case '/about':
        return 'about';
      default:
        return 'home';
    }
  }
}
