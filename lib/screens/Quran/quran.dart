// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:islami/screens/Quran/SurahText.dart';
import 'package:islami/screens/Quran/consts.dart';
import 'package:islami/screens/Quran/surah_details_screen.dart';
import 'package:islami/theme.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildQuranWidget();
  }
}

class BuildQuranWidget extends StatelessWidget {
  const BuildQuranWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            child: Center(child: Image.asset("assets/images/quran.png")),
          ),
        ),
        Expanded(
          flex: 7,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: double.infinity,
                  width: 3,
                  color: AppTheme.primaryLight,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: AppTheme.primaryLight,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "عدد الايات ",
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "اسم السورة",
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: AppTheme.primaryLight,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) => ItemSurahText(
                          name: Consts.surahNames[index],
                          index: index,
                          verseNums: Consts.versesNumber[index]),
                      itemCount: Consts.surahNames.length,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
