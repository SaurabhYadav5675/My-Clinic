import 'package:flutter/material.dart';

import '../utility_widgets.dart';

class RowItems extends StatelessWidget {
  IconData Icons;
  String title;

  RowItems(this.Icons, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons,
          size: 20,
        ),
        UtilityWidgets.horizontalSpace(10),
        Text(title),
      ],
    );
  }
}
