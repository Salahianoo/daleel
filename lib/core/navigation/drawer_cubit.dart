import 'package:flutter_bloc/flutter_bloc.dart';

enum DrawerPage {
  home,
  guide,
  location,
  announcements,
  profile,
  settings,
  help,
  about,
}

class DrawerCubit extends Cubit<DrawerPage> {
  DrawerCubit() : super(DrawerPage.home);

  void setCurrentPage(DrawerPage page) {
    emit(page);
  }

  void setCurrentPageFromRoute(String route) {
    final page = _getPageFromRoute(route);
    emit(page);
  }

  DrawerPage _getPageFromRoute(String route) {
    switch (route) {
      case '/':
      case '/home':
        return DrawerPage.home;
      case '/guide':
        return DrawerPage.guide;
      case '/location':
        return DrawerPage.location;
      case '/announcements':
        return DrawerPage.announcements;
      case '/profile':
        return DrawerPage.profile;
      case '/settings':
        return DrawerPage.settings;
      case '/help':
        return DrawerPage.help;
      case '/about':
        return DrawerPage.about;
      default:
        return DrawerPage.home;
    }
  }

  String getCurrentPageName() {
    switch (state) {
      case DrawerPage.home:
        return 'home';
      case DrawerPage.guide:
        return 'guide';
      case DrawerPage.location:
        return 'location';
      case DrawerPage.announcements:
        return 'announcements';
      case DrawerPage.profile:
        return 'profile';
      case DrawerPage.settings:
        return 'settings';
      case DrawerPage.help:
        return 'help';
      case DrawerPage.about:
        return 'about';
    }
  }
}
