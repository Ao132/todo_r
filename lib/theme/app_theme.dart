import 'package:flutter/material.dart';

class AppTheme {
  static const primaryLight = Color(0xff5D9CEC);
  static const blackColor = Color(0xff363636);
  static const whiteColor = Color(0xffffffff);
  static const greenLight = Color(0xffDFECDB);
  static const greenColor = Color(0xff61E757);
  static const redColor = Color(0xffEC4B4B);
  static const greyColor = Colors.grey;
  static const primaryDark = Color(0xff060E1E);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: greenLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryLight,
        // toolbarHeight: 150,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: primaryLight,
          unselectedItemColor: greyColor,
          backgroundColor: Colors.transparent,
          elevation: 0),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryLight,
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        labelMedium: TextStyle(color: primaryLight, fontSize: 17),
        displayLarge: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: blackColor, fontSize: 18, fontWeight: FontWeight.bold),
      ));
  static ThemeData darkTheme = ThemeData();
}
