import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'landing_page_controller.g.dart';

class LandingPageController = LandingPageControllerBase
    with _$LandingPageController;

abstract class LandingPageControllerBase with Store, ChangeNotifier {
  final BuildContext context;
  LandingPageControllerBase(this.context);

  initLogic(context) async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.popAndPushNamed(context, '/login-page');

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (prefs.containsKey("pa-app")) {
    //   Provider.of<GlobalAccess>(context, listen: false).controllerIdSheet.text =
    //       prefs.getString("pa-app");
    //   Navigator.popAndPushNamed(context, '/list-page');
    // }
  }

  configureAndGoToList(context) async {
    // showCustomDialog(DialogCircularProgressIndicator());
    // saveId();
    // await _listRepository.doPost(ActionEvent(action: Constants.config));
    // Navigator.pop(context);
    // Navigator.popAndPushNamed(context, '/list-page');
  }

  Future saveId() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString(
    //     "pa-app",
    //     Provider.of<GlobalAccess>(context, listen: false)
    //         .controllerIdSheet
    //         .text);
  }
}
