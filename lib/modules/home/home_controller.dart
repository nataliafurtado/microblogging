import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ChangeNotifier {
  BuildContext context;

  HomeControllerBase(this.context);

  @observable
  TabController tabController;

  @observable
  int currentTabBar;

  @action
  homeInit(int initialIndexTabBar) async {
    currentTabBar = initialIndexTabBar;
    tabController.addListener(() {
      currentTabBar = tabController.index;
    });
  }

  @action
  goToTab(int indexTabBar) async {
    currentTabBar = indexTabBar;
    tabController.animateTo(indexTabBar);
  }
}
