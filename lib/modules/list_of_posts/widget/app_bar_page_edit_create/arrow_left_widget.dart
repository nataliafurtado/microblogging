import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../assets/style.dart';

class ArrowLeftWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        child: FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: Style.secondaryColor,
        ),
      ),
    );
  }
}
