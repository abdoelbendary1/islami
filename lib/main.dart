import 'package:flutter/material.dart';
import 'package:islami/screens/Quran/surah_details_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SurahDetailsScreen.routeName: (context) => SurahDetailsScreen(),
      },
    );
  }
}
