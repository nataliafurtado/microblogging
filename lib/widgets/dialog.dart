import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../assets/style.dart';

class DialogWarn extends StatelessWidget {
  final String text;
  const DialogWarn(
    this.text,
  );
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: FaIcon(
            FontAwesomeIcons.microblog,
            color: Style.secondaryColor,
            size: 60,
          ),
        ),
        Container(height: 50),
        Container(
          child: Text(text),
        ),
      ],
    ));
  }
}
