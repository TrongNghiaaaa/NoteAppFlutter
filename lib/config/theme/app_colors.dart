import 'package:flutter/material.dart';

class AppColors {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  //NUMBALA COLORS
  static const Color primaryColor = Color(0xff0A98CC);
  // Text color
  static const Color textColor3 = Color(0xffF15A41);
  static const Color textColor2 = Color(0xff707070);
  static const Color textColor1 = Color(0xff222222);
  static const Color textColor4 = Color(0xff555868);
  static const Color textColorBaseGrey = Color(0xffC8C5CB);
  static const Color textColorDarkGrey = Color(0xff827D89);

  static const Color dividerColor = Color(0xffEEEEEE);
  static const Color dividerColor2 = Color(0xffD9D9D9);
  static const Color textFieldColor = Color(0xffF0F0F0);

  // background color
  static const Color backgroundSplash = Color(0xFF1D202B);
  static const Color backgroundLightOnboarding = Color(0xFFD9E8FA);
  static const Color appBackground = Color(0xFFf5f5f5);
  static const Color scaffoldBackground = Color(0xfff5f5f5);
  static const Color homeScreenCategoryBackground = Color(0xfffefefe);
  static const Color backgroundItemStore2 = Color(0xFFC1F1CD);
  static const Color backgroundItemStore3 = Color(0xFFFFD1C9);
  static const Color primarybase = Color(0xFF6A3EA1);
  static const Color backgroundColorHomescr = Color(0xffFAF8FC);

  // Linear Gradient
  static const Color gradient1 = Color(0xFFC0E5F7);
  static const Color gradient2 = Color(0xFFF1F9FE);
  static const Color gradient3 = Color(0xFFE1F4FD);
  static const Color gradient4 = Color(0xFF3FC7F1);

  //border color
  static const Color borderColor = Color(0xFFD7D7D7);
  static const Color borderColor2 = Color(0xffF8DA81);
  static const Color borderColor3 = Color(0xFFF2F2F2);
  static const Color scrollBgrColor = Color(0xFFE5E5E5);
  static const Color borderItemStore1 = Color(0xFF49B9E7);
  static const Color borderItemStore2 = Color(0xFF59CF79);
  static const Color borderItemStore3 = Color(0xFFFA836F);

  static const Color starBgrColor = Color(0xFFFDF8E6);
  static const Color discountBgr = Color(0xffFEF4F2);

  static const Color lightDarkGray = Color(0xFF75788D);
  static const Color lightBlackPercent15 = Color(0xff000000);
  static const Color lightGrayPercent10 = Color(0x1AD3D3D7);
  static Color iconGray = Colors.black.withOpacity(0.15);
  static Color searchBar = Colors.white.withOpacity(0.25);
  static const Color menuTab = Color(0xFFE1F4FD);

  static const Color isVerifyCard = Color(0xFF55D355);
  static const Color isVerifyCardBackground = Color(0xFFDEFADE);
  static const Color notVerifyCard = Color(0xFFC72136);
  static const Color notVerifyCardBackground = Color(0xFFFEE5E5);

  static const Color yellow = Color(0xFFFEB139);
  static const Color yellow2 = Color(0xFFFF991F);
  static const Color yellow3 = Color(0xFFFFBE56);
  static const Color lightYellow = Color(0xFFFFFAE5);
  static const Color green = Color(0xFF0A8754);
  static const Color green2 = Color(0xFF00875A);
  static const Color green3 = Color(0xFF11A978);
  static const Color green4 = Color(0xFF35B447);
  static const Color green5 = Color(0xFF3ED053);
  static const Color green6 = Color(0xFF21B236);
  static const Color lightGreen = Color(0xFF61D095);
  static const Color lightGreen2 = Color(0xFFE2FFEE);
  static const Color red = Color(0xFFD62246);
  static const Color lightRed = Color(0xFFD9778E);
  static const Color darkBlue = Color(0xFF293462);
  static const Color darkBlue2 = Color(0xFF172B4D);
  static const Color lightDarkBlue = Color(0xFF6274BD);
  static const Color pink = Color(0xFFF0386B);
  static const Color lightPink = Color(0xFFEC7192);
  static const Color navy = Color(0xFF101629);
  static const Color lightNavy = Color(0xFF435CAB);
  static const Color redOrange = Color(0xFFFE4A49);
  static const Color orange = Color(0xFFFE5D26);
  static const Color purpleLight = Color(0xFFCD96EA);
  static const Color blue = Color(0xFF167FFC);
  static const Color blue2 = Color(0xFF52C8FF);
  static const Color blue3 = Color(0xFFF1FAFE);
  static const Color steel = Color(0xFF00D1DF);
  static const Color blueLight100 = Color(0x3391C3FF);
  static const Color purple = Color(0xFF595BD4);
  static const Color darkBlueItem = Color(0xFF3983C2);

  static const Color darkGray = Color(0xFF222725);
  static const Color black = Color(0xFF191923);
  static const Color lightRedOrange = Color(0xFFFF5F5E);
  static const Color lightOrange = Color(0xFFFE9E7D);
  static const Color lightBlue = Color(0xFF73B2FD);
  static const Color lightBlue2 = Color(0xFFDADADB);
  static const Color lightGray = Color(0xFF9999A1);
  static const Color lightGray2 = Color(0xFF7A869A);
  static const Color lightGray3 = Color(0xffcccccc);

  static const Color silver = Color(0xFFF6FFF8);
  static const Color silver100 = Color(0xFFACAEBE);
  static const Color silver50 = Color(0x80ACAEBE);
  static const Color silver20 = Color(0x33ACAEBE);
  static const Color white = Color(0xFFFFFFFF);

  static const Color frequentColor1 = Color(0xFFB0E0E6);
  static const Color groupTitleColor = Color(0xFF030303);
  static const Color importantColor0 = Color(0xFFFFA500);
  static const Color importantColor1 = Color(0xFFFFD700);
  static const Color moderateColor0 = Color(0xFFFFFF00);
  static const Color moderateColor1 = Color(0xFFFFFF99);
  static const Color normalColor0 = Color(0xFF008000);
  static const Color normalColor1 = Color(0xFF00FF00);
  static const Color noteColor0 = Color(0xFFFF69B4);
  static const Color noteColor1 = Color(0xFFFFB6C1);
  static const Color primaryColor0 = Color(0xFFFF9432);
  static const Color primaryColor1 = Color(0xFFCB2C2C);
  static const Color urgentColor0 = Color(0xFFFF0000);
  static const Color urgentColor1 = Color(0xFFFF9999);
  static const Color iconColor1 = Color(0xFF42526E);
  static const Color iconColor2 = Color(0xFF707070);

  static const Color myShopBackground = Color(0xFFC0E5F7);
  static const Color myShopBorder = Color(0xFF49B9E7);
  static const Color myShopTitle = Color(0xFF1481B5);

  static const Color myProductBackground = Color(0xFFC1F1CD);
  static const Color myProductBorder = Color(0xFF59CF79);
  static const Color myProductTotal = Color(0xFF28A44A);

  static const Color myOrderBackground = Color(0xFFFFD1C9);
  static const Color myOrderBorder = Color(0xFFFA836F);
  static const Color myOrderTotal = Color(0xFFDE3E24);
  // incaditor color
  static const Color indicatorSecondaryBase = Color(0xFFDEDC52);

  static const Color inputBorderColor = Color(0xFFDDDDDD);
  static const LinearGradient backgroundLinearColor = LinearGradient(
    colors: [
      Color(0xFFE3F1FB),
      Color(0xFFC0E5F7),
    ],
  );
  static const LinearGradient backgroundOrderItem = LinearGradient(colors: [
    Color(0xFFE3F1FB),
    Color(0xFFF1F9FE),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
