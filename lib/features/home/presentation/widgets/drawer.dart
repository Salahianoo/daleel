import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/widgets/drawer_menu_item.dart';
import '../../../../core/widgets/app_drawer_header.dart';
import '../../../../core/widgets/theme_toggle_item.dart';
import '../../../../core/widgets/logout_menu_item.dart';
import '../../../../core/services/navigation_service.dart';
import 'package:daleel/cubit/drawer_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    // Update drawer state based on current route
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<DrawerCubit>().setCurrentPageFromRoute(currentRoute);
      });
    }

    return BlocBuilder<DrawerCubit, DrawerPage>(
      builder: (context, currentPage) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Drawer Header
              const AppDrawerHeader(),

              // Menu Items
              DrawerMenuItem(
                icon: Icons.home,
                title: localizations.home,
                isSelected: currentPage == DrawerPage.home,
                onTap: () {
                  context.read<DrawerCubit>().setCurrentPage(DrawerPage.home);
                  NavigationService.navigateToPage(context, '/home');
                },
              ),

              DrawerMenuItem(
                icon: Icons.language,
                title: localizations.chooseLanguage,
                isSelected: currentPage == DrawerPage.guide,
                onTap: () {
                  context.read<DrawerCubit>().setCurrentPage(DrawerPage.guide);
                  NavigationService.navigateToPage(context, '/guide');
                },
              ),

              DrawerMenuItem(
                icon: Icons.location_on,
                title: localizations.location,
                isSelected: currentPage == DrawerPage.location,
                onTap: () {
                  context.read<DrawerCubit>().setCurrentPage(
                    DrawerPage.location,
                  );
                  NavigationService.navigateToPage(
                    context,
                    '/location',
                    replacement: false,
                  );
                },
              ),

              DrawerMenuItem(
                icon: Icons.announcement,
                title: localizations.advertisingServices,
                isSelected: currentPage == DrawerPage.announcements,
                onTap: () {
                  context.read<DrawerCubit>().setCurrentPage(
                    DrawerPage.announcements,
                  );
                  NavigationService.navigateToPage(context, '/announcements');
                },
              ),

              DrawerMenuItem(
                icon: Icons.person,
                title: localizations.profile,
                isSelected: currentPage == DrawerPage.profile,
                onTap: () {
                  context.read<DrawerCubit>().setCurrentPage(
                    DrawerPage.profile,
                  );
                  NavigationService.navigateToPage(context, '/profile');
                },
              ),

              const Divider(),

              DrawerMenuItem(
                icon: Icons.settings,
                title: localizations.settings,
                isSelected: currentPage == DrawerPage.settings,
                unselectedTextColor: Colors.grey,
                unselectedIconColor: Colors.grey,
                onTap: () {
                  context.read<DrawerCubit>().setCurrentPage(
                    DrawerPage.settings,
                  );
                  NavigationService.navigateToPage(context, '/settings');
                },
              ),

              DrawerMenuItem(
                icon: Icons.help,
                title: localizations.help,
                isSelected: currentPage == DrawerPage.help,
                unselectedTextColor: Colors.grey,
                unselectedIconColor: Colors.grey,
                onTap: () {
                  context.read<DrawerCubit>().setCurrentPage(DrawerPage.help);
                  NavigationService.navigateToPage(context, '/help');
                },
              ),

              DrawerMenuItem(
                icon: Icons.info,
                title: localizations.about,
                isSelected: currentPage == DrawerPage.about,
                unselectedTextColor: Colors.grey,
                unselectedIconColor: Colors.grey,
                onTap: () {
                  context.read<DrawerCubit>().setCurrentPage(DrawerPage.about);
                  NavigationService.navigateToPage(context, '/about');
                },
              ),

              const Divider(),

              // Dark Mode Toggle
              const ThemeToggleItem(),

              const Divider(),

              // Logout
              LogoutMenuItem(
                onLogout: () {
                  // Add actual logout logic here
                  // For example: context.read<AuthCubit>().logout();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
