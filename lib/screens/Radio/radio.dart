// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:islami/theme.dart';
import 'package:islami/screens/Quran/consts.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int counterNum = 0;
  final sebhatList = Consts.sebhatList;
  double angle = 0;
  int currentIndex = 0;
  String sebhat = " الله أكبر";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Spacer(),
        Image.asset(height: 300, width: 500, "assets/images/Radio.png"),
        Text(
          "إذاعه القرءان الكريم",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 60,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/Icon metro-next-1.png"),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/Icon awesome-play.png"),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/Icon metro-next.png"),
              )
            ],
          ),
        ),
        Spacer(),
      ]),
    );
  }
}
