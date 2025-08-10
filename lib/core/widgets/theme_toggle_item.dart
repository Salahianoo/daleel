import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/theme/theme_cubit.dart';
import '../../l10n/app_localizations.dart';

class ThemeToggleItem extends StatelessWidget {
  final String? lightModeText;
  final String? darkModeText;

  const ThemeToggleItem({super.key, this.lightModeText, this.darkModeText});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final effectiveLightModeText = lightModeText ?? localizations.lightMode;
    final effectiveDarkModeText = darkModeText ?? localizations.darkMode;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state == ThemeState.dark;
        return ListTile(
          leading: Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: theme.iconTheme.color,
          ),
          title: Text(
            isDarkMode ? effectiveDarkModeText : effectiveLightModeText,
            style: theme.textTheme.bodyMedium,
          ),
          trailing: Switch(
            value: isDarkMode,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme();
            },
            activeColor: theme.colorScheme.primary,
          ),
          onTap: () {
            context.read<ThemeCubit>().toggleTheme();
          },
        );
      },
    );
  }
}
