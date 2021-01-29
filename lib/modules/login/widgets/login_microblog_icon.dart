import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../assets/style.dart';

class LoginMicroblogIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FaIcon(
        FontAwesomeIcons.microblog,
        color: Style.secondaryColor,
        size: 120,
      ),
    );
  }
}
