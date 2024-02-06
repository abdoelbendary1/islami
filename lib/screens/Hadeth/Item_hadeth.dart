import 'package:flutter/material.dart';
import 'package:islami/screens/Hadeth/hadeth_details_screen.dart';
import 'package:islami/screens/Quran/surah_details_screen.dart';

class ItemHadeth extends StatelessWidget {
  ItemHadeth({required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: HadethDetailsArgs(index: index));
      },
      child: Center(
          child: Text(
        "الحديث رقم ${index + 1}",
      )),
    );
  }
}

class HadethDetailsArgs {
  int index;
  HadethDetailsArgs({required this.index});
}
