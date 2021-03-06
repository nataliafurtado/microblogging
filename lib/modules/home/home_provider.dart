import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../latest_news/latest_news.controller.dart';
import '../list_of_posts/list_of_posts_controller.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListOfPostsController>(
      create: (context) => ListOfPostsController(context),
      child: ChangeNotifierProvider<LatestNewsController>(
        create: (context) => LatestNewsController(context),
        child: ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(context),
          child: HomePage(),
        ),
      ),
    );
  }
}
