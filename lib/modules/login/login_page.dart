import 'package:flutter/material.dart';
import 'package:microblogging/modules/login/teddy/teddy_controller.dart';
import 'package:provider/provider.dart';

import '../../assets/constants.dart';
import '../../assets/style.dart';
import '../../widgets/button.dart';
import '../../widgets/title_widget.dart';
import 'login_controller.dart';
import 'teddy/teddy.dart';
import 'widgets/login_buttons.dart';
import 'widgets/login_developed_by.dart';
import 'widgets/login_new_user.dart';

class LoginPage extends StatelessWidget {
  final double paddingSides = 24;
  final totalSizeOfAllWidgets = 630;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    LoginController loginController =
        Provider.of<LoginController>(context, listen: false);
    loginController.ifExistsLoadLastUserLogin();
    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: Constants.topPadding),
              TitleWidget(
                Constants.microblogging,
              ),
              Container(height: 35),
              Teddy(),
              Container(height: 35),
              LoginButtons(_formKey),
              LoginNewUser(),
              Container(
                height: 50,
              ),
              loginButton(loginController, context),
              Container(height: 60),
              LoginDevelopedBy()
            ],
          ),
        ),
      ),
    );
  }

  Container loginButton(LoginController loginController, context) {
    TeddyController controllerTedyy =
        Provider.of<TeddyController>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
      ),
      child: Button(
        "Entrar",
        () async {
          if (_formKey.currentState.validate()) {
            controllerTedyy.succes();
            await Future.delayed(Duration(seconds: 1));
            loginController.login(
              loginController.loginController.text,
              loginController.passwordController.text,
            );
          } else {
            controllerTedyy.fails();
          }
        },
        keyPassed: Key("button-login-enter"),
      ),
    );
  }
}
