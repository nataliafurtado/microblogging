// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LandingPageController on LandingPageControllerBase, Store {
  final _$itemsAtom = Atom(name: 'LandingPageControllerBase.items');

  @override
  List<String> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<String> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$LandingPageControllerBaseActionController =
      ActionController(name: 'LandingPageControllerBase');

  @override
  dynamic addItem(String item) {
    final _$actionInfo = _$LandingPageControllerBaseActionController
        .startAction(name: 'LandingPageControllerBase.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$LandingPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
