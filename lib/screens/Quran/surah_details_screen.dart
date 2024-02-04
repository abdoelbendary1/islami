import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/screens/Quran/SurahText.dart';
import 'package:islami/screens/Quran/item_surah_details.dart';
import 'package:islami/theme.dart';

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
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppTheme.primaryLight,
                ))
              : Card(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.02,
                      vertical: MediaQuery.of(context).size.width * 0.05),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "سورة ${args.name}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: ImageIcon(AssetImage(
                                    "assets/images/Icon awesome-play-circle.png"))),
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
                            separatorBuilder: (context, index) => Divider(
                              thickness: 1,
                              color: AppTheme.primaryLight,
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
                ),
        ),
      ],
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
