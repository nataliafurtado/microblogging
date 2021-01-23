import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:microblogging/modules/login/login_controller.dart';
import 'package:microblogging/modules/login/teddy/teddy_controller.dart';
import 'package:microblogging/modules/login/teddy/widgets/tracking_text_input.dart';
import 'package:microblogging/widgets/button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final double paddingSides = 24;
  final double topDistance = 100;
  @override
  Widget build(BuildContext context) {
    TeddyController _controllerTedyy =
        Provider.of<TeddyController>(context, listen: false);
    LoginController _loginController =
        Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.fromLTRB(paddingSides, topDistance, paddingSides, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 200,
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: FlareActor(
                    "lib/assets/Teddy.flr",
                    shouldClip: false,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                    controller: _controllerTedyy,
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TrackingTextInput(
                            label: "Email",
                            hint: "What's your email address?",
                            onCaretMoved: (Offset caret) {
                              _controllerTedyy.lookAt(caret);
                            }),
                        TrackingTextInput(
                          label: "Password",
                          hint: "Try 'bears'...",
                          isObscured: true,
                          onCaretMoved: (Offset caret) {
                            _controllerTedyy.coverEyes(caret != null);
                            _controllerTedyy.lookAt(null);
                          },
                          onTextChanged: (String value) {
                            _controllerTedyy.setPassword(value);
                          },
                        ),
                        Button("Entrar", () {
                          //
                          //
                          //
                          _loginController.login();
                          // _controllerTedyy.submitPassword();
                        }),
                      ],
                    )),
                  )),
              // SignInLogo(),
              // Container(
              //   height: flexHeightSpacing(context, 0.1),
              //   child: Center(
              //     child: Text(
              //       "S.of(context).SIGN_IN_ADICIONAR_CONTA",
              //       style: TextStyle(
              //         color: Colors.cyan,
              //         fontSize: 16.0,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              // SignInLogo(),
              // controllerSigIn.loadSignInLogic(),
              // SignInToken(),
              // SignInDevelopedBy(),
              Container(
                height: 25,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
