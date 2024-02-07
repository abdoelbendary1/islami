import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/screens/Hadeth/Item_hadeth.dart';
import 'package:islami/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        SizedBox(
          child: Center(
            child: Image.asset("assets/images/hadeth.png"),
          ),
        ),
        Divider(
          thickness: 3,
          color: provider.isDarkMode()
              ? AppTheme.yellowDark
              : AppTheme.primaryLight,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          thickness: 3,
          color: provider.isDarkMode()
              ? AppTheme.yellowDark
              : AppTheme.primaryLight,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
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
