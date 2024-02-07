// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/screens/Hadeth/Item_hadeth.dart';
import 'package:islami/screens/Hadeth/Item_hadeth_details.dart';

import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<AppConfigProvider>(context);
    return Card(
      color: provider.isDarkMode() ? AppTheme.primaryDark : AppTheme.whiteColor,
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
              color: provider.isDarkMode()
                  ? AppTheme.whiteColor
                  : AppTheme.primaryLight,
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
