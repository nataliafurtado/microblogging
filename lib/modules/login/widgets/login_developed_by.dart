import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../assets/style.dart';
import '../../../functions/functions.dart';

class LoginDevelopedBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: flexWidthSpacing(context, 1),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Desenvolvido por Natália Furtado",
            style: Style.cardSubTitle
                .copyWith(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Container(width: 3),
          FaIcon(
            FontAwesomeIcons.transgenderAlt,
            color: Style.detailDarkColor,
            size: 12,
          ),
        ],
      ),
    );
  }
}
