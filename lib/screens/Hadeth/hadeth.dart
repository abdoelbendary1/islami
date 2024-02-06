import 'package:flutter/material.dart';
import 'package:islami/screens/Hadeth/Item_hadeth.dart';
import 'package:islami/theme.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Center(child: Image.asset("assets/images/hadeth.png")),
        ),
        Divider(
          thickness: 3,
          color: AppTheme.primaryLight,
        ),
        Text(
          "الأحاديث ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          thickness: 3,
          color: AppTheme.primaryLight,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) => ItemHadeth(index: index),
            itemCount: 50,
          ),
        ),
      ],
    );
  }
}
