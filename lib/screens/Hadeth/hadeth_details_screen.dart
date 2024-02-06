// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/screens/Hadeth/Item_hadeth.dart';
import 'package:islami/screens/Hadeth/Item_hadeth_details.dart';
import 'package:islami/screens/Quran/item_surah_details.dart';
import 'package:islami/theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  HadethDetailsScreen({super.key});
  static final String routeName = "/HadethDetailsScreen";

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  List<String> verses = [];
  String? hadethNum;

  @override
  Widget build(BuildContext context) {
    var hadethArgs =
        ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;
    loadFile(hadethArgs.index);
    return buildHadethScreen(context);
  }

  Stack buildHadethScreen(BuildContext context) {
    return Stack(
    children: [
      Image.asset(
        "assets/images/main_background.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "Islami",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: buildHadethCard(context),
      ),
    ],
  );
  }

  Card buildHadethCard(BuildContext context) {
    return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${hadethNum}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Container(
                  color: AppTheme.primaryLight,
                  height: 3,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => ItemHadethDetails(
                            name: verses[index],
                          ),
                      separatorBuilder: (context, index) => Divider(
                            thickness: 1,
                            color: Colors.transparent,
                          ),
                      itemCount: verses.length),
                )
              ],
            ),
          ),
        );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/hadeth/h${index + 1}.txt");
    List<String> lines = content.split("\n");
    verses = lines;
    hadethNum = verses[0];
    verses.removeAt(0);
    setState(() {});
  }
}
