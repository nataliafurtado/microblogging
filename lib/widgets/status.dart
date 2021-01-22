import 'package:flutter/material.dart';

import '../assets/style.dart';
import '../functions/functions.dart';

class ActionStatus extends StatelessWidget {
  final String text;
  const ActionStatus(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: flexWidthSpacing(context, 1),
      decoration: BoxDecoration(
        color: statusColors(text),
      ),
      child: Center(
        child: Text(
          text,
          style: Style.white,
        ),
      ),
    );
  }
}
