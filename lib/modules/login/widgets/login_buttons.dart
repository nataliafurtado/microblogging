import 'package:flutter/material.dart';
import 'package:microblogging/modules/login/login_controller.dart';
import 'package:provider/provider.dart';

import '../teddy/teddy_controller.dart';
import '../teddy/widgets/tracking_text_input.dart';

class LoginButtons extends StatelessWidget {
  final GlobalKey<FormState> keyPassed;
  const LoginButtons(this.keyPassed);
  @override
  Widget build(BuildContext context) {
    TeddyController controllerTedyy =
        Provider.of<TeddyController>(context, listen: false);

    LoginController controlleLogin =
        Provider.of<LoginController>(context, listen: false);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.center,
        child: Form(
            key: keyPassed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TrackingTextInput(
                  keyPassed: Key("imput-login-login"),
                  textController: controlleLogin.loginController,
                  label: "Login",
                  hint: "Digite seu login",
                  onCaretMoved: (Offset caret) {
                    controllerTedyy.lookAt(caret);
                  },
                  validator: (String text) {
                    if (text.trim().isEmpty) {
                      return "Campo não pode ser vazio";
                    }
                    return null;
                  },
                ),
                TrackingTextInput(
                  keyPassed: Key("imput-login-password"),
                  textController: controlleLogin.passwordController,
                  label: "Senha",
                  hint: "Digite sua senha",
                  isObscured: true,
                  onCaretMoved: (Offset caret) {
                    controllerTedyy.coverEyes(caret != null);
                    controllerTedyy.lookAt(null);
                  },
                  onTextChanged: (String value) {
                    controllerTedyy.setPassword(value);
                  },
                  onFocusChange: (bool hasFocus) {
                    if (hasFocus) {
                      controllerTedyy.coverEyes(false);
                    }
                  },
                  validator: (String text) {
                    if (text.trim().isEmpty) {
                      return "Campo não pode ser vazio";
                    }
                    return null;
                  },
                ),
              ],
            )));
  }
}
