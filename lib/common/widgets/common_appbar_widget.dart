import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final IconData backIcon;
  final Color? backgroundColor;
  final Color? titleColor;
  final List<Widget>? actions;
  final double elevation;
  final Widget? leading;
  final TextStyle? titleTextStyle;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final Color? backIconColor;

  const CommonAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.backIcon = Icons.arrow_back,
    this.backgroundColor,
    this.titleColor,
    this.actions,
    this.elevation = 0,
    this.leading,
    this.titleTextStyle,
    this.titleFontSize = 18,
    this.titleFontWeight = FontWeight.bold,
    this.backIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      elevation: elevation,
      centerTitle: true,
      title: title != null && title!.isNotEmpty
          ? Text(
              title!,
              style: titleTextStyle ??
                  TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: titleFontWeight,
                    color: titleColor ?? Colors.white,
                  ),
            )
          : null,
      leading: leading ??
          (showBackButton
              ? IconButton(
                  icon: Icon(backIcon, color: backIconColor ?? Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
