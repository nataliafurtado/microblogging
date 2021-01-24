import 'package:flutter/material.dart';
import 'package:microblogging/assets/constants.dart';
import 'package:microblogging/widgets/dialog_circular_progress_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../functions/functions.dart';
import '../../widgets/dialog.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store, ChangeNotifier {
  final BuildContext context;
  LoginControllerBase(this.context);

  TextEditingController newLoginController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ifExistsLoadLastUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginSaved = prefs.getString(Constants.lastUserLogim);
    if (loginSaved != null) {
      loginController.text = loginSaved;
    }
  }

  login(String login, String senha) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(login.trim()) &&
        prefs.getString(login.trim()) == senha.trim()) {
      prefs.setString(Constants.lastUserLogim, login.trim());
      Navigator.popAndPushNamed(context, '/home-page');
    } else {
      showCustomDialog(DialogWarn("Usuário ou senha errada"));
    }
  }

  goToNewUSerPage() {
    newLoginController.text = "";
    newPasswordController.text = "";
    Navigator.pushNamed(context, '/login-new-user', arguments: this);
  }

  saveNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      newLoginController.text.trim(),
      newPasswordController.text.trim(),
    );

    Navigator.of(context).pop();

    login(
      newLoginController.text,
      newPasswordController.text,
    );
  }
}
