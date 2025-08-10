import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import 'drawer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: theme.appBarTheme.elevation,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: theme.appBarTheme.foregroundColor),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text(
        localizations.shamsiehEducation,
        style: theme.appBarTheme.titleTextStyle,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.network(
            "https://www.shamsieh.education/img/Logo_Shamsieh.png",
            height: 35,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Scaffold wrapper that includes both AppBar and Drawer
class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String? title;

  const CustomScaffold({super.key, required this.body, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(),
      body: body,
    );
  }
}
