import 'package:flutter/material.dart';

import 'package:microblogging/assets/style.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget(
    this.text,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(
        text,
        style: Style.titleFont,
      ),
    );
  }
}
