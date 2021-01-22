import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'landing_page_controller.dart';
import 'widgets/1_init.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    LandingPageController controllerGlobalAcess =
        Provider.of<LandingPageController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controllerGlobalAcess.initLogic(context);
    });

    return Scaffold(
      body: InitPage(),
    );
  }
}
