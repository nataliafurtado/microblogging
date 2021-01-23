// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$tabControllerAtom = Atom(name: 'HomeControllerBase.tabController');

  @override
  TabController get tabController {
    _$tabControllerAtom.reportRead();
    return super.tabController;
  }

  @override
  set tabController(TabController value) {
    _$tabControllerAtom.reportWrite(value, super.tabController, () {
      super.tabController = value;
    });
  }

  final _$currentTabBarAtom = Atom(name: 'HomeControllerBase.currentTabBar');

  @override
  int get currentTabBar {
    _$currentTabBarAtom.reportRead();
    return super.currentTabBar;
  }

  @override
  set currentTabBar(int value) {
    _$currentTabBarAtom.reportWrite(value, super.currentTabBar, () {
      super.currentTabBar = value;
    });
  }

  final _$homeInitAsyncAction = AsyncAction('HomeControllerBase.homeInit');

  @override
  Future homeInit(int initialIndexTabBar) {
    return _$homeInitAsyncAction.run(() => super.homeInit(initialIndexTabBar));
  }

  final _$goToTabAsyncAction = AsyncAction('HomeControllerBase.goToTab');

  @override
  Future goToTab(int indexTabBar) {
    return _$goToTabAsyncAction.run(() => super.goToTab(indexTabBar));
  }

  @override
  String toString() {
    return '''
tabController: ${tabController},
currentTabBar: ${currentTabBar}
    ''';
  }
}
