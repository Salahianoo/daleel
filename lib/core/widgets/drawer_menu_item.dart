import 'package:flutter/material.dart';

class DrawerMenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? selectedColor;
  final Color? unselectedTextColor;
  final Color? unselectedIconColor;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.selectedColor,
    this.unselectedTextColor,
    this.unselectedIconColor,
  });

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveSelectedColor = widget.selectedColor ?? Colors.cyan;
    final effectiveUnselectedTextColor =
        widget.unselectedTextColor ?? theme.textTheme.bodyMedium?.color;
    final effectiveUnselectedIconColor =
        widget.unselectedIconColor ?? theme.iconTheme.color;

    // Show as selected if either actually selected or just tapped
    final showAsSelected = widget.isSelected || _isTapped;

    return ListTile(
      leading: Icon(widget.icon),
      title: Text(widget.title),
      tileColor: showAsSelected ? effectiveSelectedColor : null,
      textColor: showAsSelected ? Colors.white : effectiveUnselectedTextColor,
      iconColor: showAsSelected ? Colors.white : effectiveUnselectedIconColor,
      onTap: () {
        setState(() {
          _isTapped = true;
        });

        // Reset the tapped state after a short delay
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            setState(() {
              _isTapped = false;
            });
          }
        });

        widget.onTap();
      },
    );
  }
}
