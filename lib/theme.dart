// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryLight = Color(0xffB7935F);
  static final Color blackColor = Color(0xff242424);
  static final Color primaryDark = Color(0xff141A2E);
  static final Color yellowDark = Color(0xffFACC1D);
  static final Color whiteColor = Color(0xffffffff);

  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLight,
      iconTheme: IconThemeData(color: blackColor),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontSize: 25,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 30,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
            fontSize: 30, color: blackColor, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            fontSize: 25, color: blackColor, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            fontSize: 20, color: blackColor, fontWeight: FontWeight.w400),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 40),
          unselectedIconTheme: IconThemeData(size: 35),
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          backgroundColor: primaryLight,
          type: BottomNavigationBarType.fixed));
  static ThemeData darkMode = ThemeData(
      primaryColor: primaryDark,
      iconTheme: IconThemeData(color: AppTheme.whiteColor),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
            fontSize: 30,
            color: AppTheme.yellowDark,
            fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            fontSize: 25,
            color: AppTheme.yellowDark,
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
            fontSize: 20,
            color: AppTheme.yellowDark,
            fontWeight: FontWeight.w400),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 40),
          unselectedIconTheme: IconThemeData(size: 35),
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          selectedItemColor: yellowDark,
          backgroundColor: primaryDark,
          type: BottomNavigationBarType.fixed));
}
