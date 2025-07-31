import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String currentPage = 'home'; // Track current page

  @override
  void initState() {
    super.initState();
    // Initialize currentPage based on current route
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCurrentPageFromRoute();
    });
  }

  void _updateCurrentPageFromRoute() {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != null) {
      setState(() {
        switch (currentRoute) {
          case '/home':
            currentPage = 'home';
            break;
          case '/guide':
            currentPage = 'guide';
            break;
          case '/announcements':
            currentPage = 'announcements';
            break;
          case '/profile':
            currentPage = 'profile';
            break;
          case '/settings':
            currentPage = 'settings';
            break;
          case '/help':
            currentPage = 'help';
            break;
          case '/about':
            currentPage = 'about';
            break;
          default:
            currentPage = 'home';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF1DD3B0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and app name
                Row(
                  children: [
                    Image.network(
                      "https://www.shamsieh.education/img/Logo_Shamsieh.png",
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      localizations.shamsiehEducation,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  localizations.shamsiehEducation,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const Spacer(),
                Text(
                  localizations.educationalPlatform,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),

          // Menu Items
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(localizations.home),
            tileColor: currentPage == 'home' ? Colors.cyan : null,
            textColor: currentPage == 'home' ? Colors.white : null,
            iconColor: currentPage == 'home' ? Colors.white : null,
            onTap: () {
              setState(() {
                currentPage = 'home';
              });
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),

          ListTile(
            leading: const Icon(Icons.language),
            title: Text(localizations.chooseLanguage),
            tileColor: currentPage == 'guide' ? Colors.cyan : null,
            textColor: currentPage == 'guide' ? Colors.white : null,
            iconColor: currentPage == 'guide' ? Colors.white : null,
            onTap: () {
              setState(() {
                currentPage = 'guide';
              });
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/guide');
            },
          ),

          ListTile(
            leading: const Icon(Icons.announcement),
            title: Text(localizations.advertisingServices),
            tileColor: currentPage == 'announcements' ? Colors.cyan : null,
            textColor: currentPage == 'announcements' ? Colors.white : null,
            iconColor: currentPage == 'announcements' ? Colors.white : null,
            onTap: () {
              setState(() {
                currentPage = 'announcements';
              });
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/announcements');
            },
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: Text(localizations.profile),
            tileColor: currentPage == 'profile' ? Colors.cyan : null,
            textColor: currentPage == 'profile' ? Colors.white : null,
            iconColor: currentPage == 'profile' ? Colors.white : null,
            onTap: () {
              setState(() {
                currentPage = 'profile';
              });
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(localizations.settings),
            tileColor: currentPage == 'settings' ? Colors.cyan : null,
            textColor: currentPage == 'settings' ? Colors.white : Colors.grey,
            iconColor: currentPage == 'settings' ? Colors.white : Colors.grey,
            onTap: () {
              setState(() {
                currentPage = 'settings';
              });
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),

          ListTile(
            leading: const Icon(Icons.help),
            title: Text(localizations.help),
            tileColor: currentPage == 'help' ? Colors.cyan : null,
            textColor: currentPage == 'help' ? Colors.white : Colors.grey,
            iconColor: currentPage == 'help' ? Colors.white : Colors.grey,
            onTap: () {
              setState(() {
                currentPage = 'help';
              });
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/help');
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: Text(localizations.about),
            tileColor: currentPage == 'about' ? Colors.cyan : null,
            textColor: currentPage == 'about' ? Colors.white : Colors.grey,
            iconColor: currentPage == 'about' ? Colors.white : Colors.grey,
            onTap: () {
              setState(() {
                currentPage = 'about';
              });
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/about');
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(localizations.logout),
            onTap: () {
              Navigator.pop(context);
              // Add logout logic here
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.confirmLogout),
          content: Text(localizations.logoutMessage),
          actions: [
            TextButton(
              child: Text(localizations.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(localizations.logout),
              onPressed: () {
                Navigator.of(context).pop();
                // Add actual logout logic here
              },
            ),
          ],
        );
      },
    );
  }
}
