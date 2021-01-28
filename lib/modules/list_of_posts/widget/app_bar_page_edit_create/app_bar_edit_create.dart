import 'package:flutter/material.dart';

import 'arrow_left_widget.dart';
import 'trash_widget.dart';

class AppBarEditCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ArrowLeftWidget(),
          TrashWidget(),
        ],
      ),
    );
  }
}
