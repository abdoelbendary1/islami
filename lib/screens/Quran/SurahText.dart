import 'package:flutter/material.dart';
import 'package:islami/screens/Quran/surah_details_screen.dart';

class ItemSurahText extends StatelessWidget {
  ItemSurahText(
      {required this.name, required this.index, required this.verseNums});
  String name;
  int verseNums;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SurahDetailsScreen.routeName,
            arguments: SurahDetailsArgs(
                name: name, index: index, verseNums: verseNums));
      },
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              child: Text(
                "$verseNums",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SurahDetailsArgs {
  String name;
  int verseNums;
  int index;
  SurahDetailsArgs(
      {required this.name, required this.index, required this.verseNums});
}
