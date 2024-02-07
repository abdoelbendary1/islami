import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
            provider.changeLanguage("en");
          },
          child: Container(
            width: double.infinity,
            child: provider.app_language == "en"
                ? getSelctedItemWidget(AppLocalizations.of(context)!.english)
                : getUnselectedItemWidget(
                    AppLocalizations.of(context)!.english),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {
            provider.changeLanguage("ar");
          },
          child: Container(
            width: double.infinity,
            child: provider.app_language == "ar"
                ? getSelctedItemWidget(AppLocalizations.of(context)!.arabic)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.arabic),
          ),
        ),
      ]),
    );
  }

  Widget getSelctedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
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
