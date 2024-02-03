// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryLight = Color(0xffB7935F);
  static final Color blackColor = Color(0xff242424);

  static ThemeData lightMode = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
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
