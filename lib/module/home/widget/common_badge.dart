import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../../config/theme/app_colors.dart';

class CommonBadge extends StatelessWidget {
  const CommonBadge(
      {super.key,
      required this.count,
      required this.badgeIcon,
      this.showBagde = true});
  final int count;
  final Widget badgeIcon;
  final bool showBagde;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -8, end: -6),
      showBadge: showBagde,
      ignorePointer: false,
      onTap: () {},
      badgeStyle: const badges.BadgeStyle(
          elevation: 0,
          badgeColor: AppColors.textColor3,
          shape: badges.BadgeShape.circle,
          borderSide: BorderSide(color: Colors.white, width: 1)),
      badgeContent: Text(
        count.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      badgeAnimation: const badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      child: badgeIcon,
    );
  }
}
