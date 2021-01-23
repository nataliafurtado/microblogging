// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_news.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LatestNewsController on LatestNewsControllerBase, Store {
  final _$newsAtom = Atom(name: 'LatestNewsControllerBase.news');

  @override
  News get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(News value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$fetchLatestNewsAsyncAction =
      AsyncAction('LatestNewsControllerBase.fetchLatestNews');

  @override
  Future fetchLatestNews() {
    return _$fetchLatestNewsAsyncAction.run(() => super.fetchLatestNews());
  }

  @override
  String toString() {
    return '''
news: ${news}
    ''';
  }
}
