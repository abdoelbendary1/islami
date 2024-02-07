import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/screens/Quran/SurahText.dart';
import 'package:islami/screens/Quran/consts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildQuranWidget();
  }
}

class BuildQuranWidget extends StatelessWidget {
  const BuildQuranWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
                  color: provider.isDarkMode()
                      ? AppTheme.yellowDark
                      : AppTheme.primaryLight,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: provider.isDarkMode()
                        ? AppTheme.yellowDark
                        : AppTheme.primaryLight,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.verse_nums,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.surah_name,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: provider.isDarkMode()
                        ? AppTheme.yellowDark
                        : AppTheme.primaryLight,
                  ),
                  SizedBox(
                    height: 10,
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
