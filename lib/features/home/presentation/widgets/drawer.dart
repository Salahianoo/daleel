import 'package:flutter/material.dart';

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
                    const Text(
                      'شمسية التعليمية',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Shamsieh Education',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const Spacer(),
                const Text(
                  'Educational Platform',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),

          // Menu Items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('الصفحة الرئيسية'),
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
            leading: const Icon(Icons.school),
            title: const Text('الدليل التعليمي'),
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
            title: const Text('خدمات اعلانية'),
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
            title: const Text('الملف الشخصي'),
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
            title: const Text('الإعدادات'),
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
            title: const Text('المساعدة'),
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
            title: const Text('حول التطبيق'),
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
            title: const Text('تسجيل الخروج'),
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تسجيل الخروج'),
          content: const Text('هل أنت متأكد من رغبتك في تسجيل الخروج؟'),
          actions: [
            TextButton(
              child: const Text('إلغاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('تسجيل الخروج'),
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
