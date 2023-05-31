import 'package:flutter/material.dart';

Color kLightPrimaryColor = const Color(0xFF253145);
Color kLightSecondaryColor = const Color(0xFF6d82a3);

Color kDarkPrimaryColor = const Color(0xFF0f1926);
Color kDarkSecondaryColor = const Color(0xFFfffefe);

Color kWhite = Colors.white;
Color kRed = Colors.red;
Color kRedLight = const Color(0xFFf36d58);
Color kRedMedium = const Color(0xFFff4f5a);
Color kRedDeep = const Color(0xFFF71B24);
Color kBlack = Colors.black;
Color kBlackLight = const Color(0xFF303030);
Color kBlackMedium = const Color(0xFF404040);
Color kBlue = const Color(0xFF3879E9);
Color kBlueLight = const Color(0xFFC7D0EC);
Color kBlueDark = const Color(0xFF243E8B);
Color kGrey = const Color(0xFF9EA1B6);
Color kGreyMedium = const Color(0xFFC4C4C4);
Color kGreyLight = const Color(0xFFe7e7e6);
Color kGreen = const Color(0xFF1CAF5E);
Color kOrange = const Color(0xFFFFA800);
Color kDeepOrange = const Color(0xFFFF5F2D);

Color kShadowColor = const Color(0xFF616161).withOpacity(0.18);
Color kItemShadowColor = const Color(0xFF000000).withOpacity(0.10);
Color kGreyTextColor = const Color(0xFFA5A5A5);
Color kDividerColor = const Color(0xFFE8ECF2);
Color kBlueGrey = const Color(0xFF7D8FAB);

Color kShimmerBaseColor = Colors.grey.shade300;
Color kShimmerHighlightColor = Colors.grey.shade100;

Color successColor = Colors.green;
Color failedColor = Colors.red;
Color warningColor = Colors.orange;

Color kLightScaffoldBgColor = Colors.white;
Color kDarkScaffoldBgColor = const Color(0xFF222a3b);

Map<int, Color> lightMaterialColor = const {
  50: Color.fromRGBO(37, 49, 69, .1),
  100: Color.fromRGBO(37, 49, 69, .2),
  200: Color.fromRGBO(37, 49, 69, .3),
  300: Color.fromRGBO(37, 49, 69, .4),
  400: Color.fromRGBO(37, 49, 69, .5),
  500: Color.fromRGBO(37, 49, 69, .6),
  600: Color.fromRGBO(37, 49, 69, .7),
  700: Color.fromRGBO(37, 49, 69, .8),
  800: Color.fromRGBO(37, 49, 69, .9),
  900: Color.fromRGBO(37, 49, 69, 1),
};

MaterialColor kLightPrimarySwatchColor = MaterialColor(
  0xFF253145 ,
  lightMaterialColor,
);

Map<int, Color> darkMaterialColor = const {
   50: Color.fromRGBO(255, 255, 255, .1),
  100: Color.fromRGBO(255, 255, 255, .2),
  200: Color.fromRGBO(255, 255, 255, .3),
  300: Color.fromRGBO(255, 255, 255, .4),
  400: Color.fromRGBO(255, 255, 255, .5),
  500: Color.fromRGBO(255, 255, 255, .6),
  600: Color.fromRGBO(255, 255, 255, .7),
  700: Color.fromRGBO(255, 255, 255, .8),
  800: Color.fromRGBO(255, 255, 255, .9),
  900: Color.fromRGBO(255, 255, 255, 1),
};

MaterialColor kDarkPrimarySwatchColor = MaterialColor(
  0xFFffffff,
  darkMaterialColor,
);
