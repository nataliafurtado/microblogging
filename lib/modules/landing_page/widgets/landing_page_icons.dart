import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microblogging/assets/style.dart';

class LandingPageIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FaIcon(
            FontAwesomeIcons.transgenderAlt,
            color: Style.secondaryColor,
            size: 16,
          ),
          FaIcon(
            FontAwesomeIcons.fistRaised,
            color: Style.secondaryColor,
            size: 16,
          ),
          FaIcon(
            FontAwesomeIcons.solidHandshake,
            color: Style.secondaryColor,
            size: 16,
          ),
        ],
      ),
    );
  }
}
