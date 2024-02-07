// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:islami/screens/Quran/consts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SebhaScreeen extends StatefulWidget {
  const SebhaScreeen({super.key});

  @override
  State<SebhaScreeen> createState() => _SebhaScreeenState();
}

class _SebhaScreeenState extends State<SebhaScreeen> {
  int counterNum = 0;
  final sebhatList = Consts.sebhatList;
  double angle = 0;
  int currentIndex = 0;
  String sebhat = " الله أكبر";
  @override
  Widget build(BuildContext context) {
    return createSebhaScreen(context);
  }

  Center createSebhaScreen(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Center(
      child: Column(
        children: [
          AnimatedRotation(
            turns: angle,
            duration: Duration(milliseconds: 50),
            child: Image.asset(
              "assets/images/Sebha.png",
              color: provider.isDarkMode()
                  ? AppTheme.yellowDark
                  : AppTheme.primaryLight,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.sebha_nums,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 30,
          ),
          CreateTextShape(
              text: "$counterNum",
              width: 90,
              height: 90,
              raduis: 20,
              textSize: 20,
              onTap: () {}),
          SizedBox(
            height: 20,
          ),
          CreateTextShape(
            text: sebhat,
            width: 170,
            height: 51,
            raduis: 30,
            textSize: 25,
            onTap: counter,
          ),
          Spacer(
            flex: 8,
          ),
        ],
      ),
    );
  }

  void counter() {
    setState(() {
      counterNum++;
      angle += 11 / 360;
      if (counterNum % 33 == 0) {
        sebhat = sebhatList[currentIndex];
        currentIndex++;
        if (currentIndex == 3) {
          currentIndex = 0;
        }
        // Reset counterNum after updating sebhat
      }
    });
  }
}

class CreateTextShape extends StatelessWidget {
  CreateTextShape(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.raduis,
      required this.textSize,
      required this.onTap});

  final String text;
  final double width;
  final double height;
  final double raduis;
  double textSize;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: provider.isDarkMode()
                ? AppTheme.yellowDark
                : AppTheme.primaryLight,
            foregroundColor:
                provider.isDarkMode() ? AppTheme.blackColor : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(raduis))),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: textSize),
        ),
      ),
    );
  }
}
