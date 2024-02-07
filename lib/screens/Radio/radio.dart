// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Spacer(),
        Image.asset(height: 300, width: 500, "assets/images/Radio.png"),
        Text(
          AppLocalizations.of(context)!.radio_name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 60,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/Icon metro-next-1.png",
                  color: provider.isDarkMode()
                      ? AppTheme.yellowDark
                      : AppTheme.primaryLight,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/Icon awesome-play.png",
                  color: provider.isDarkMode()
                      ? AppTheme.yellowDark
                      : AppTheme.primaryLight,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/Icon metro-next.png",
                  color: provider.isDarkMode()
                      ? AppTheme.yellowDark
                      : AppTheme.primaryLight,
                ),
              )
            ],
          ),
        ),
        Spacer(),
      ]),
    );
  }
}
