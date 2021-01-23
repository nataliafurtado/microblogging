import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../models/news.dart';
import 'latest_news_repository.dart';

part 'latest_news.controller.g.dart';

class LatestNewsController = LatestNewsControllerBase
    with _$LatestNewsController;

abstract class LatestNewsControllerBase with Store, ChangeNotifier {
  BuildContext context;

  LatestNewsControllerBase(this.context);

  @observable
  News news;
  LatestNwesRepository latestNwesRepository = LatestNwesRepository();

  @action
  fetchLatestNews() async {
    news = await latestNwesRepository.fetchLatestNews();

    // for (var i = 0; i < news.news.length; i++) {
    //   print(news.news[i].message.content);
    // }
  }
}
