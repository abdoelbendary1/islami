import 'package:flutter/material.dart';
import 'package:islami/screens/Quran/surah_details_screen.dart';

class ItemSurahText extends StatelessWidget {
  ItemSurahText({required this.name, required this.index});
  String name;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SurahDetailsScreen.routeName,
            arguments: SurahDetailsArgs(name: name, index: index));
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SurahDetailsArgs {
  String name;
  int index;
  SurahDetailsArgs({required this.name, required this.index});
}
