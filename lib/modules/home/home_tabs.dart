import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../assets/style.dart';
import 'home_controller.dart';

class HomeTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController controllerHome =
        Provider.of<HomeController>(context, listen: false);

    return Observer(builder: (_) {
      return TabBar(
        tabs: [
          Tab(
            child: FaIcon(
              FontAwesomeIcons.microblog,
              color: controllerHome.currentTabBar == 0
                  ? Style.primaryColor
                  : Style.menuBackground,
              size: 22,
            ),
          ),
          Tab(
            child: Container(
              child: Image.asset(
                "lib/assets/images/bot2.png",
                color: controllerHome.currentTabBar == 1
                    ? Style.primaryColor
                    : Style.menuBackground,
                height: 75,
                width: 75,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        labelColor: Colors.yellow,
        unselectedLabelColor: Colors.blue,
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(color: Style.secondaryColor, width: 3.0),
          ),
        ),
        controller: controllerHome.tabController,
        indicatorColor: Style.secondaryColor,
      );
    });
  }
}
