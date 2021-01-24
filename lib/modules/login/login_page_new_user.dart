import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microblogging/widgets/dialog.dart';
import 'package:provider/provider.dart';

import '../../assets/constants.dart';
import '../../assets/style.dart';
import '../../functions/functions.dart';
import '../../widgets/button.dart';
import '../../widgets/title_widget.dart';
import 'login_controller.dart';

class LoginNewUserPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final double totalSizeOfAllWidgets = 560;
  @override
  Widget build(BuildContext context) {
    LoginController controlleLogin =
        Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.padding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(height: 20),
                TitleWidget(
                  "Novo Usuário",
                ),
                Container(
                  height: calculateBottonButtonsBottonDistance(
                      context, totalSizeOfAllWidgets),
                  alignment: Alignment.center,
                  child: Container(
                    child: FaIcon(
                      FontAwesomeIcons.microblog,
                      color: Style.secondaryColor,
                      size: 120,
                    ),
                  ),
                ),
                Container(height: 40),
                TextFormField(
                  controller: controlleLogin.newLoginController,
                  decoration: Style.inputDecoration(
                      hint: "Digite um novo login", label: "Login"),
                  validator: (String text) {
                    if (text.trim().isEmpty) {
                      return "Campo não pode ser vazio";
                    }
                    return null;
                  },
                ),
                Container(height: 30),
                TextFormField(
                  obscureText: true,
                  controller: controlleLogin.newPasswordController,
                  decoration: Style.inputDecoration(
                      hint: "Digite uma nova senha", label: "Senha"),
                  validator: (String text) {
                    if (text.trim().isEmpty) {
                      return "Campo não pode ser vazio";
                    } else if (text.trim().length < 5) {
                      return "A senha deve ter no mínimo 6 caracteres ";
                    }
                    return null;
                  },
                ),
                Container(height: 100),
                loginButton(controlleLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(LoginController loginController) {
    return Button("Cadastrar", () {
      if (_formKey.currentState.validate()) {
        loginController.saveNewUser();
      }
    });
  }
}
