import 'package:flutter/material.dart';
import 'package:microblogging/modules/login/teddy/teddy_controller.dart';
import 'package:provider/provider.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TeddyController>(
      create: (context) => TeddyController(context),
      child: ChangeNotifierProvider<LoginController>(
        create: (context) => LoginController(context),
        child: LoginPage(),
      ),
    );
  }
}
