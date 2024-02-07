// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/screens/Settings/language_bottom_sheet.dart';
import 'package:islami/screens/Settings/mode-bottom_sheet.dart';
import 'package:islami/theme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.langauge,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: provider.isDarkMode()
                    ? AppTheme.whiteColor
                    : AppTheme.blackColor),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: showLanguageList,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? AppTheme.yellowDark
                      : AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.app_language == "en"
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: provider.isDarkMode()
                            ? AppTheme.blackColor
                            : AppTheme.whiteColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: provider.isDarkMode()
                        ? AppTheme.blackColor
                        : AppTheme.whiteColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: provider.isDarkMode()
                    ? AppTheme.whiteColor
                    : AppTheme.blackColor),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: showModeList,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? AppTheme.yellowDark
                      : AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: provider.isDarkMode()
                            ? AppTheme.blackColor
                            : AppTheme.whiteColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: provider.isDarkMode()
                        ? AppTheme.blackColor
                        : AppTheme.whiteColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showLanguageList() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  showModeList() {
    showModalBottomSheet(
        context: context, builder: (context) => ModeBottomSheet());
  }
}
