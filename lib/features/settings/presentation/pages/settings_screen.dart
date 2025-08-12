import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:daleel/cubit/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return CustomScaffold(
      title: localizations.settings,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Dark Mode Setting
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                final isDarkMode = state == ThemeState.dark;

                return Card(
                  child: ListTile(
                    leading: Icon(
                      isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      isDarkMode ? 'Dark Mode' : 'Light Mode',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      isDarkMode
                          ? 'Switch to light theme'
                          : 'Switch to dark theme',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    onTap: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Language Setting (redirect to language screen)
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.language,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  localizations.chooseLanguage,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  'Change app language',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, '/guide');
                },
              ),
            ),

            const SizedBox(height: 16),

            // About Setting
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  localizations.about,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  'App information and version',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
            ),

            const SizedBox(height: 16),

            // Help Setting
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.help,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  localizations.help,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  'Get help and support',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, '/help');
                },
              ),
            ),

            const Spacer(),

            // App version info
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text(
                    localizations.shamsiehEducation,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Version 1.0.0',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
