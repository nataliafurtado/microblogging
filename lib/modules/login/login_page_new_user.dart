import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assets/constants.dart';
import '../../functions/functions.dart';
import '../../widgets/button.dart';
import '../../widgets/imput_text_field_widget.dart';
import '../../widgets/title_widget.dart';
import '../list_of_posts/widget/app_bar_page_edit_create/arrow_left_widget.dart';
import 'login_controller.dart';
import 'widgets/login_microblog_icon.dart';

class LoginNewUserPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final double totalSizeOfAllWidgets = 650;
  @override
  Widget build(BuildContext context) {
    LoginController controlleLogin =
        Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.padding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(height: 50),
                Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: ArrowLeftWidget(),
                ),
                TitleWidget("Novo Usuário"),
                Container(
                  height: calculateBottonButtonsBottonDistance(
                      context, totalSizeOfAllWidgets),
                  alignment: Alignment.center,
                  child: LoginMicroblogIcon(),
                ),
                Container(height: 100),
                ImputTextFieldWidget(
                  keyPassed: Key("imput-text-new-user-name"),
                  controller: controlleLogin.newNameController,
                  hint: "Digite seu nome",
                  label: "Nome",
                  validator: (String text) {
                    if (text.trim().isEmpty) {
                      return "Campo não pode ser vazio";
                    }
                    return null;
                  },
                ),
                Container(height: 30),
                ImputTextFieldWidget(
                  keyPassed: Key("imput-text-new-user-login"),
                  controller: controlleLogin.newLoginController,
                  hint: "Digite um novo login",
                  label: "Login",
                  validator: (String text) {
                    if (text.trim().isEmpty) {
                      return "Campo não pode ser vazio";
                    }
                    return null;
                  },
                ),
                Container(height: 30),
                ImputTextFieldWidget(
                  keyPassed: Key("imput-text-new-user-password"),
                  controller: controlleLogin.newPasswordController,
                  hint: "Digite uma nova senha",
                  obscureText: true,
                  label: "Senha",
                  validator: (String text) {
                    if (text.trim().isEmpty) {
                      return "Campo não pode ser vazio";
                    } else if (text.trim().length < 5) {
                      return "A senha deve ter no mínimo 6 caracteres ";
                    }
                    return null;
                  },
                ),
                Container(height: 60),
                loginButton(controlleLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(LoginController loginController) {
    return Button(
      "Cadastrar",
      () {
        if (_formKey.currentState.validate()) {
          loginController.saveNewUser();
        }
      },
      keyPassed: Key("save-new-user-button"),
    );
  }
}
