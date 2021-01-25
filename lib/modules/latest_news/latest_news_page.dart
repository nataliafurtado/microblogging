import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:microblogging/global_acess.dart';
import 'package:provider/provider.dart';

import '../../models/latest_news.dart';
import '../../widgets/title_widget.dart';
import 'latest_news.controller.dart';

class LatestNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LatestNewsController controllerLatestNews =
        Provider.of<LatestNewsController>(context, listen: false);
    controllerLatestNews.fetchLatestNews();

    return Observer(builder: (_) {
      return controllerLatestNews.news == null
          ? Container(
              height: 300,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(height: 40),
                TitleWidget(
                  "Últimas novidades",
                  logout:
                      Provider.of<GlobalAccess>(context, listen: false).logout,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return controllerLatestNews.fetchLatestNews();
                    },
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controllerLatestNews.news.news.length,
                        itemBuilder: (ctx, index) {
                          LatestNews latestNews =
                              controllerLatestNews.news.news[index];
                          return Container(
                            child: Text(latestNews.user.name),
                          );
                        }),
                  ),
                ),
                Container(height: 30),
              ],
            );
    });
  }
}
// Image.network(controllerLatestNews
//     .news.news[index].user.profilePicture
