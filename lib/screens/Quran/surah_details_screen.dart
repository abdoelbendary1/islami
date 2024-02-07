import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/screens/Quran/SurahText.dart';
import 'package:islami/screens/Quran/item_surah_details.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class SurahDetailsScreen extends StatefulWidget {
  SurahDetailsScreen({super.key});
  static final String routeName = "/SurahDetails";

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return buildSurahScreen(context, args);
  }

  Stack buildSurahScreen(BuildContext context, SurahDetailsArgs args) {
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
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppTheme.primaryLight,
                ))
              : buildSurahCard(context, args),
        ),
      ],
    );
  }

  Card buildSurahCard(BuildContext context, SurahDetailsArgs args) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.05),
      color: provider.isDarkMode() ? AppTheme.primaryDark : AppTheme.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "سورة ${args.name}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage("assets/images/Icon awesome-play-circle.png"),
                  ),
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
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: provider.isDarkMode()
                      ? Colors.white
                      : AppTheme.primaryLight,
                ),
                itemBuilder: (context, index) => ItemSurahDetails(
                  name: verses[index],
                  index: index,
                ),
                itemCount: verses.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split('\n');
    verses = lines;

    setState(() {});
  }
}
