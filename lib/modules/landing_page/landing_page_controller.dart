import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'landing_page_controller.g.dart';

class LandingPageController = LandingPageControllerBase
    with _$LandingPageController;

abstract class LandingPageControllerBase with Store, ChangeNotifier {
  final BuildContext context;
  LandingPageControllerBase(this.context);

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @observable
  List<String> items = [];

  @action
  addItem(String item) {
    listKey.currentState
        .insertItem(items.length, duration: const Duration(milliseconds: 500));
    items = []
      ..addAll(items)
      ..add(item);
  }

  initLogic(context) async {
    loadSkills();
    await Future.delayed(Duration(seconds: 7));
    Navigator.popAndPushNamed(context, '/login-page');
  }

  loadSkills() async {
    addItem("Experiente em DART/FLUTTER");
    await Future.delayed(Duration(seconds: 1));
    addItem("API REST");
    await Future.delayed(Duration(seconds: 1));
    addItem("Dev skills");
    await Future.delayed(Duration(seconds: 1));
    addItem("SCRUM");
    await Future.delayed(Duration(seconds: 1));
    addItem("Testes automatizados");
    await Future.delayed(Duration(seconds: 1));
    addItem("Banco de dados relacional");
    await Future.delayed(Duration(seconds: 1));
  }
}
