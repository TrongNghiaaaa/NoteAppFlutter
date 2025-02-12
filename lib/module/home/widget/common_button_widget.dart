import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:note_app/core/constant/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String? content;
  final Color? color;
  final Color? backgroundColor;
  final Color? colorText;
  final bool? showRightIcon;
  final Icon? iconRight;
  final bool? showLeftIcon;
  final Icon? iconLeft;
  final double? borderRadius;
  final Image? image;
  final MainAxisAlignment? mainAxisAlignment;
  final VoidCallback onPressed;

  const CommonButton({
    super.key,
    this.content,
    this.color,
    this.backgroundColor,
    this.colorText,
    this.showRightIcon,
    this.iconRight,
    this.showLeftIcon,
    this.iconLeft,
    this.borderRadius,
    this.image,
    this.mainAxisAlignment,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: backgroundColor ?? AppColors.primarybase,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            side: BorderSide(color: color ?? AppColors.lightGray, width: 1),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            if (showRightIcon == true) const Spacer(),
            if (showLeftIcon == true)
              image ??
                  Image.asset(
                    "assets/images/icon_gg.png",
                    height: 20,
                    width: 20,
                  ),
            const Gap(16),
            Text(
              content ?? "Đăng nhập",
              style: TextStyle(
                  color: colorText ?? AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            if (showRightIcon == true) iconRight ?? const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
