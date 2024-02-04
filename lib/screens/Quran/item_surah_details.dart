import 'package:flutter/material.dart';

class ItemSurahDetails extends StatelessWidget {
  ItemSurahDetails({required this.name, required this.index});
  String name;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "$name (${index + 1})",
        style: Theme.of(context).textTheme.bodySmall,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
