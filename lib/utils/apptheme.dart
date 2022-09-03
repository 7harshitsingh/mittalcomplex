// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mittalcomplex/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';

const appName = "mittalcomplex";
class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: mcPrimaryColor,
    primaryColorDark: mcPrimaryColorDark,
    errorColor: Colors.red,
    hoverColor: Colors.white38,
    dividerColor: viewLineColor,
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    appBarTheme: const AppBarTheme(
      color: whiteColor,
      iconTheme: IconThemeData(color: textPrimaryColor),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: const ColorScheme.light(primary: mcPrimaryColor, primaryVariant: mcPrimaryColor),
    cardTheme: const CardTheme(color: Colors.white),
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: const TextTheme(
      button:  TextStyle(color: mcPrimaryColor),
      headline6:  TextStyle(color: textPrimaryColor),
      subtitle2:  TextStyle(color: textSecondaryColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android:  FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS:  CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux:  OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS:  OpenUpwardsPageTransitionsBuilder(),
    }),
  );
}
