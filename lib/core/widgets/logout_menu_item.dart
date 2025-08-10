import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class LogoutMenuItem extends StatelessWidget {
  final VoidCallback? onLogout;
  final String? logoutText;
  final String? confirmTitle;
  final String? confirmMessage;
  final String? cancelText;

  const LogoutMenuItem({
    super.key,
    this.onLogout,
    this.logoutText,
    this.confirmTitle,
    this.confirmMessage,
    this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final effectiveLogoutText = logoutText ?? localizations.logout;
    final effectiveConfirmTitle = confirmTitle ?? localizations.confirmLogout;
    final effectiveConfirmMessage =
        confirmMessage ?? localizations.logoutMessage;
    final effectiveCancelText = cancelText ?? localizations.cancel;

    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: Text(
        effectiveLogoutText,
        style: const TextStyle(color: Colors.red),
      ),
      onTap: () {
        Navigator.pop(context);
        _showLogoutDialog(
          context,
          effectiveConfirmTitle,
          effectiveConfirmMessage,
          effectiveCancelText,
          effectiveLogoutText,
        );
      },
    );
  }

  void _showLogoutDialog(
    BuildContext context,
    String title,
    String message,
    String cancelText,
    String confirmText,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text(cancelText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                confirmText,
                style: const TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (onLogout != null) {
                  onLogout!();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
