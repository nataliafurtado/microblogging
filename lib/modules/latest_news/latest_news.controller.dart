import 'package:flutter/material.dart';
import 'package:microblogging/functions/functions.dart';
import 'package:microblogging/widgets/dialog.dart';
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
    try {
      news = await latestNwesRepository.fetchLatestNews();
    } catch (e) {
      if (e is int) {
        showCustomDialog(DialogWarn("Erro: " + e.toString()));
      } else {
        showCustomDialog(DialogWarn("Algo inesperado ocorreu"));
      }
    }
  }
}
