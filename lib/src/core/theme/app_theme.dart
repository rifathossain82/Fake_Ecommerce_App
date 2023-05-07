import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeData {
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kScaffoldBgColor,
    primarySwatch: kPrimarySwatchColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kWhite,
      foregroundColor: kBlackLight,
      elevation: 2,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        /// Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: MyTextStyles.h4.copyWith(
        color: kGreyTextColor,
      ),
      labelStyle: MyTextStyles.h4,
      floatingLabelStyle: MyTextStyles.h4.copyWith(
        color: kPrimarySwatchColor,
      ),
      filled: true,
      fillColor: kScaffoldBgColor,
      prefixIconColor: kPrimarySwatchColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kGrey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kPrimarySwatchColor,
        ),
      ),
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: kBlackLight),
      bodyText2: TextStyle(color: kBlackLight),
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: kWhite
    ),
    dialogTheme: DialogTheme(
      backgroundColor: kWhite,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStatePropertyAll(kPrimarySwatchColor),
    ),
    iconTheme: IconThemeData(
      color: kBlackLight,
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );

  // static final ThemeData darkTheme = ThemeData(
  //   scaffoldBackgroundColor: kDarkScaffoldBgColor,
  //   primarySwatch: kPrimarySwatchColor,
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: kPrimaryDarkColor,
  //     foregroundColor: kWhite,
  //     elevation: 2,
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarColor: kSecondaryDarkColor,
  //
  //       /// Status bar brightness (optional)
  //       statusBarIconBrightness: Brightness.light, // For Android (light icons)
  //       statusBarBrightness: Brightness.light, // For iOS (light icons)
  //     ),
  //   ),
  //   // kPrimaryLightColor: appColorPrimary,
  //   // primaryColorDark: appColorPrimary,
  //   // errorColor: Colors.red,
  //   // hoverColor: Colors.white54,
  //   // dividerColor: const Color(0xFFEAEAEA),
  //   // // fontFamily: GoogleFonts.openSans().fontFamily,
  //   // appBarTheme: const AppBarTheme(
  //   //   color: appLayout_background,
  //   //   iconTheme: IconThemeData(color: textLight),
  //   //   systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
  //   // ),
  //   // textSelectionTheme: const TextSelectionThemeData(cursorColor: textDark),
  //   inputDecorationTheme: InputDecorationTheme(
  //     hintStyle: MyTextStyles.h4.copyWith(
  //       color: kGreyTextColor,
  //     ),
  //     labelStyle: MyTextStyles.h4,
  //     floatingLabelStyle: MyTextStyles.h4.copyWith(
  //       color: kPrimarySwatchColor,
  //     ),
  //     filled: true,
  //     fillColor: kDarkScaffoldBgColor,
  //     prefixIconColor: kPrimarySwatchColor,
  //     enabledBorder: OutlineInputBorder(
  //       borderSide: BorderSide(
  //         color: kWhite,
  //       ),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderSide: BorderSide(
  //         color: kPrimarySwatchColor,
  //       ),
  //     ),
  //   ),
  //   textTheme: const TextTheme(
  //     subtitle1: TextStyle(color: Colors.white),
  //     bodyText2: TextStyle(color: Colors.white),
  //   ),
  //   bottomSheetTheme: BottomSheetThemeData(
  //       backgroundColor: kPrimaryDarkColor
  //   ),
  //   dialogTheme: DialogTheme(
  //     backgroundColor: kPrimaryDarkColor,
  //   ),
  //   radioTheme: RadioThemeData(
  //     fillColor: MaterialStatePropertyAll(kWhite),
  //   ),
  //   iconTheme: const IconThemeData(
  //     color: Colors.white,
  //   ),
  //   // colorScheme: const ColorScheme.light(primary: appColorPrimary, primaryVariant: appColorPrimary),
  //   // cardTheme: const CardTheme(color: bgLight),
  //   // cardColor: bgLight,
  //   // // textTheme: TextTheme(
  //   // //   button: TextStyle(color: appColorPrimary),
  //   // //   headline6: TextStyle(color: textPrimaryColor),
  //   // //   subtitle2: TextStyle(color: textSecondaryColor),
  //   // // ),
  //   // visualDensity: VisualDensity.adaptivePlatformDensity,
  // ).copyWith(
  //   pageTransitionsTheme: const PageTransitionsTheme(
  //       builders: <TargetPlatform, PageTransitionsBuilder>{
  //         TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  //         TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  //         TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
  //         TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
  //       }),
  // );

  static void setDarkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  static void setLightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // For Android (light icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  static void enableInitialThemeSetting() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  // top and bottom, both status bar
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }
}
