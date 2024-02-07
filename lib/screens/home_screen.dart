// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/screens/Hadeth/hadeth.dart';
import 'package:islami/screens/Quran/quran.dart';
import 'package:islami/screens/Radio/radio.dart';
import 'package:islami/screens/Sebha/sebha.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/screens/Settings/settings.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String routeName = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreeen(),
    RadioScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset(
                "assets/images/bgDark.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                "assets/images/main_background.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            iconTheme: provider.isDarkMode()
                ? IconThemeData(color: AppTheme.whiteColor)
                : IconThemeData(color: AppTheme.blackColor),
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                tabs[selectedIndex];
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/quran_icon.png"),
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/hadeth_icon.png"),
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/sebha_icon.png"),
                    ),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/radio_icon.png"),
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ]),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
