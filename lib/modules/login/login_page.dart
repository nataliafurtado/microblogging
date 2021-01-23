import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:microblogging/assets/constants.dart';
import 'package:microblogging/assets/style.dart';
import 'package:microblogging/modules/login/login_controller.dart';
import 'package:microblogging/modules/login/teddy/teddy_controller.dart';
import 'package:microblogging/modules/login/teddy/widgets/tracking_text_input.dart';
import 'package:microblogging/widgets/button.dart';
import 'package:microblogging/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final double paddingSides = 24;

  @override
  Widget build(BuildContext context) {
    TeddyController controllerTedyy =
        Provider.of<TeddyController>(context, listen: false);
    LoginController loginController =
        Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      backgroundColor: Style.iceBackground,
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: paddingSides),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: Constants.topPadding),
              Hero(
                tag: "title",
                child: TitleWidget(
                  Constants.microblogging,
                ),
              ),
              Container(height: 35),
              Container(
                  height: 200,
                  color: Style.iceBackground,
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: FlareActor(
                    "lib/assets/Teddy.flr",
                    shouldClip: false,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                    controller: controllerTedyy,
                  )),
              Container(height: 35),
              //
              //
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //     color: Colors.purple,
                  //     borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Container(
                      //   height: 180,
                      //   child: Form(
                      //     // key: _formKey,
                      //     child: TextFormField(
                      //       controller: loginController.loginCOntroller,
                      //       decoration: Style.inputDecoration(
                      //         hint: "Digite o login",
                      //         // label: "Login",
                      //       ),
                      //       onChanged: (text) {
                      //         print("wswswswsw");
                      //         controllerTedyy.lookAt(Offset(100, 0));
                      //       },
                      //       validator: (String text) {
                      //         if (text.trim().isEmpty) {
                      //           return "Campo não pode ser vazio";
                      //         } else if (text.length > 281) {
                      //           return "Máximo de 280 caracteres";
                      //         }
                      //         return null;
                      //       },
                      //     ),
                      //   ),
                      // ),

                      TrackingTextInput(
                          label: "Login",
                          hint: "Digite seu login",
                          onCaretMoved: (Offset caret) {
                            print(caret.dx);
                            print(caret.dy);

                            controllerTedyy.lookAt(caret);
                          }),
                      TrackingTextInput(
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
                      ),
                    ],
                  ))),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Button("Entrar", () {
                  //
                  //
                  //
                  loginController.login();
                  // _controllerTedyy.submitPassword();
                }),
              ),

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
            ],
          ),
        ),
      ),
    );
  }
}
