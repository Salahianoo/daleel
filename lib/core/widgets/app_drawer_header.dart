import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class AppDrawerHeader extends StatelessWidget {
  final String? logoUrl;
  final String? appName;
  final String? subtitle;
  final String? description;

  const AppDrawerHeader({
    super.key,
    this.logoUrl,
    this.appName,
    this.subtitle,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final effectiveAppName = appName ?? localizations.shamsiehEducation;
    final effectiveSubtitle = subtitle ?? localizations.shamsiehEducation;
    final effectiveDescription =
        description ?? localizations.educationalPlatform;
    final effectiveLogoUrl =
        logoUrl ?? "https://www.shamsieh.education/img/Logo_Shamsieh.png";

    return DrawerHeader(
      decoration: BoxDecoration(color: theme.colorScheme.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo and app name
          Row(
            children: [
              Image.network(
                effectiveLogoUrl,
                height: 40,
                width: 40,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.school, size: 40, color: Colors.white);
                },
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  effectiveAppName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            effectiveSubtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(
            effectiveDescription,
            style: const TextStyle(color: Colors.white60, fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
