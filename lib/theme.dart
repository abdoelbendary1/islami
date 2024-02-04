// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryLight = Color(0xffB7935F);
  static final Color blackColor = Color(0xff242424);

  static ThemeData lightMode = ThemeData(
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
}
