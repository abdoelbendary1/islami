// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class ModeBottomSheet extends StatefulWidget {
  const ModeBottomSheet({super.key});

  @override
  State<ModeBottomSheet> createState() => _ModeBottomSheetState();
}

class _ModeBottomSheetState extends State<ModeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      height: 150,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.dark);
          },
          child: SizedBox(
            width: double.infinity,
            child: provider.isDarkMode()
                ? getSelctedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.dark),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.light);
          },
          child: SizedBox(
            width: double.infinity,
            child: provider.isDarkMode()
                ? getUnselectedItemWidget(AppLocalizations.of(context)!.light)
                : getSelctedItemWidget(AppLocalizations.of(context)!.light),
          ),
        ),
      ]),
    );
  }

  Widget getSelctedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).copyWith().textTheme.bodyMedium!.copyWith(
              color: AppTheme.primaryLight, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.check_circle_sharp,
          size: 30,
          color: AppTheme.primaryLight,
        )
      ],
    );
  }

  Widget getUnselectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .copyWith()
          .textTheme
          .bodyMedium!
          .copyWith(color: AppTheme.blackColor),
    );
  }
}
