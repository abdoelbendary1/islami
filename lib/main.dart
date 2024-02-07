import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';

import 'package:islami/screens/Hadeth/hadeth_details_screen.dart';
import 'package:islami/screens/Quran/surah_details_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      theme: AppTheme.lightMode,
      themeMode: provider.app_theme,
      darkTheme: AppTheme.darkMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.app_language),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SurahDetailsScreen.routeName: (context) => SurahDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
    );
  }
}
