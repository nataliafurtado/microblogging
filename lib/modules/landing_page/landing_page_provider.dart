import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'landing_page.dart';
import 'landing_page_controller.dart';

class LandingPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LandingPageController>(
      create: (context) => LandingPageController(context),
      child: LandingPage(),
    );
  }
}
