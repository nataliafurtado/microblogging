import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store, ChangeNotifier {
  final BuildContext context;
  LoginControllerBase(this.context);

  TextEditingController loginCOntroller = TextEditingController();

  login() {
// salvar no global

    Navigator.popAndPushNamed(context, '/home-page');
  }
}
