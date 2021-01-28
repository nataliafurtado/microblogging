import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microblogging/assets/style.dart';
import 'package:microblogging/functions/functions.dart';
import 'package:microblogging/modules/landing_page/landing_page_controller.dart';

class LandingPageSlideIt extends StatelessWidget {
  final BuildContext context;
  final int index;
  final Animation<double> animation;
  final LandingPageController controllerLandingPage;
  final double totalSizeOfAllWidgets;

  const LandingPageSlideIt(
    this.context,
    this.index,
    this.animation,
    this.controllerLandingPage,
    this.totalSizeOfAllWidgets,
  );

  @override
  Widget build(BuildContext context) {
    String item = controllerLandingPage.items[index];

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(animation),
      child: Container(
        height:
            calculateLandingPageListHeight(context, totalSizeOfAllWidgets) / 6,
        child: ListTile(
          leading: FaIcon(
            FontAwesomeIcons.checkCircle,
            color: Style.secondaryColor,
            size: 20,
          ),
          title: Text('$item',
              style: Style.cardSubTitle.copyWith(
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
