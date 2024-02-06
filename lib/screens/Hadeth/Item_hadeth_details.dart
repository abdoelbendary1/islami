import 'package:flutter/material.dart';

class ItemHadethDetails extends StatelessWidget {
  ItemHadethDetails({
    required this.name,
  });
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodySmall,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
