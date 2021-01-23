import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../assets/style.dart';
import '../latest_news/latest_news_page.dart';
import '../list_of_posts/list_of_posts_controller.dart';
import '../list_of_posts/list_of_posts_page.dart';
import 'home_controller.dart';
import 'home_tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeController controllerHome;
  @override
  void initState() {
    controllerHome = Provider.of<HomeController>(context, listen: false);
    controllerHome.tabController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );
    controllerHome.homeInit(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.iceBackground,
      bottomNavigationBar: HomeTabs(),
      body: TabBarView(controller: controllerHome.tabController, children: [
        ListOfPostsPage(),
        LatestNewsPage(),
      ]),
      floatingActionButton: Observer(builder: (_) {
        return controllerHome.currentTabBar == 1
            ? Container()
            : FloatingActionButton(
                onPressed: () {
                  Provider.of<ListOfPostsController>(context, listen: false)
                      .goToNewPostPage();
                },
                backgroundColor: Style.primaryColor,
                child: Icon(
                  Icons.add,
                ),
              );
      }),
    );
  }
}
