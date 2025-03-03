import 'package:flutter/material.dart';
import 'package:note_app/config/theme/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Color backgroundColor;
  final Color titleColor;
  final List<Widget>? actions;
  final double elevation;
  final Widget? leading;
  final TextStyle? titleTextStyle;

  const CommonAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.backgroundColor = AppColors.primarybase,
    this.titleColor = Colors.white,
    this.actions,
    this.elevation = 0.5,
    this.leading,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: true,
      title: Text(
        title,
        style: titleTextStyle ??
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
      ),
      leading: leading ??
          (showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
