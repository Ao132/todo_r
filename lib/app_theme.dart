import 'package:flutter/material.dart';

class AppTheme {
  static Color primarylightColor = const Color(0xff5D9CEC);
  static Color greenColor = const Color(0xff61E757);
  static Color bgLightColor = const Color(0xffDFECDB);
  static Color redColor = const Color(0xffEC4B4B);
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff383838);
  static Color greyColor = const Color(0xff7D8490);
  static Color bgDarkColor = const Color(0xff060E1E);
  static Color blackDarkColor = const Color(0xff141922);
  static Color editColor = const Color(0xFF0392CF);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primarylightColor,
      scaffoldBackgroundColor: bgLightColor,
      appBarTheme: AppBarTheme(
          toolbarHeight: 130, elevation: 0, backgroundColor: primarylightColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: primarylightColor,
          unselectedItemColor: greyColor,
          elevation: 0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primarylightColor,
          shape: StadiumBorder(side: BorderSide(color: whiteColor, width: 4))),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
        displaySmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: blackColor),
        bodyLarge: TextStyle(
            fontSize: 17, color: greyColor, fontWeight: FontWeight.bold),
      ));
}
