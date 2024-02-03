// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:islami/screens/Hadeth/hadeth.dart';
import 'package:islami/screens/Quran/quran.dart';
import 'package:islami/screens/Radio/radio.dart';
import 'package:islami/screens/Sebha/sebha.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/main_background.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
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
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/hadeth_icon.png"),
                    ),
                    label: "Hadeth"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/sebha_icon.png"),
                    ),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/radio_icon.png"),
                    ),
                    label: "Radio"),
              ]),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
