import 'package:flutter/material.dart';
import '../../assets/constants.dart';
import '../../assets/style.dart';
import '../../functions/functions.dart';
import '../../widgets/title_widget.dart';
import 'package:provider/provider.dart';

import 'landing_page_controller.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final double totalSizeOfAllWidgets = 750;
  @override
  Widget build(BuildContext context) {
    LandingPageController controllerGlobalAcess =
        Provider.of<LandingPageController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controllerGlobalAcess.initLogic(context);
    });

    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: Constants.topPadding),
              Hero(
                tag: "title",
                child: TitleWidget(
                  Constants.microblogging,
                ),
              ),
              configurationsText(context),
              Text("Splash creen icon e nat info"),
              Container(height: 30),
              Container(
                  height: calculateBottonButtonsBottonDistance(
                      context, totalSizeOfAllWidgets)),
            ],
          ),
        ),
      ),
    );
  }

  Widget configurationsText(context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
