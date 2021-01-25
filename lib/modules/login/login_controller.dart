import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../assets/constants.dart';
import '../../functions/functions.dart';
import '../../global_acess.dart';
import '../../models/user.dart';
import '../../widgets/dialog.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store, ChangeNotifier {
  final BuildContext context;
  LoginControllerBase(this.context);

  TextEditingController newLoginController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newNameController = TextEditingController();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ifExistsLoadLastUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginSaved = prefs.getString(Constants.lastUserLogim);
    if (loginSaved != null) {
      loginController.text = loginSaved;
    }
  }

  login(String login, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userExistsAndPassworIsCorrect(prefs, login, password)) {
      setLasUsedLogin(prefs, login);
      loadGlobalUser(prefs, login);
      Navigator.popAndPushNamed(context, '/home-page');
    } else {
      showCustomDialog(DialogWarn("Usuário ou senha inválida"));
    }
  }

  bool userExistsAndPassworIsCorrect(SharedPreferences prefs, login, senha) {
    // return prefs.containsKey(login.trim()) &&
    //     prefs.getStringList(login.trim())[0] == senha.trim();
    return true;
  }

  setLasUsedLogin(SharedPreferences prefs, login) {
    prefs.setString(Constants.lastUserLogim, login.trim());
  }

  loadGlobalUser(prefs, login) {
    GlobalAccess controllerGlobalAcess =
        Provider.of<GlobalAccess>(context, listen: false);
    User newUSer = User(
      login: login,
      name: prefs.getStringList(login.trim())[1],
    );
    controllerGlobalAcess.user = newUSer;
  }

  goToNewUSerPage() {
    newLoginController.text = "";
    newPasswordController.text = "";
    newNameController.text = "";
    Navigator.pushNamed(context, '/login-new-user', arguments: this);
  }

  saveNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(newLoginController.text.trim(), [
      newPasswordController.text.trim(),
      newNameController.text.trim(),
    ]);
    Navigator.of(context).pop();
  }
}
