import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

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
            child: Text(
              "Posts",
              style: GoogleFonts.pacifico(
                  fontSize: 16,
                  letterSpacing: 0.7,
                  color: controllerHome.currentTabBar == 0
                      ? Style.primaryColor
                      : Style.menuBackground),
            ),
          ),
          Tab(
            child: Container(
              child: Image.asset(
                "lib/assets/images/bot2.png",
                color: controllerHome.currentTabBar == 1
                    ? Style.primaryColor
                    : Style.menuBackground,
                height: 65,
                width: 65,
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
