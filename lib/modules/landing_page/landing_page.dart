import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assets/constants.dart';
import '../../assets/style.dart';
import '../../functions/functions.dart';
import '../../widgets/title_widget.dart';
import 'landing_page_controller.dart';
import 'widgets/landing_page_icons.dart';
import 'widgets/landing_page_slide_it.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final double totalSizeOfAllWidgets = 260;

  @override
  Widget build(BuildContext context) {
    LandingPageController controllerLandingPage =
        Provider.of<LandingPageController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controllerLandingPage.initLogic(context);
    });

    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: Constants.topPadding),
              TitleWidget(
                "Natália Furtado",
              ),
              Container(height: 30),
              Container(
                height: calculateLandingPageListHeight(
                    context, totalSizeOfAllWidgets),
                width: 250,
                alignment: Alignment.center,
                child: AnimatedList(
                  key: controllerLandingPage.listKey,
                  initialItemCount: controllerLandingPage.items.length,
                  itemBuilder: (context, index, animation) {
                    return LandingPageSlideIt(context, index, animation,
                        controllerLandingPage, totalSizeOfAllWidgets);
                  },
                ),
              ),
              Container(height: 30),
              Container(
                child: Text(
                  "natalia.furtado.t@gmail.com",
                  style: Style.primaryColorFont,
                ),
              ),
              LandingPageIcons(),
              Container(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
