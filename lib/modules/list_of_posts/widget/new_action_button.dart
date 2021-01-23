import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../assets/style.dart';
import '../../../models/news.dart';
import '../../latest_news/latest_news_repository.dart';
import '../list_of_posts_controller.dart';

class NewActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListOfPostsController controllerList =
        Provider.of<ListOfPostsController>(context, listen: false);
    return InkWell(
      onTap: () async {
        // // controllerList.goToNewActionEventPage();
        // print("wsdwdsededede");
        // LatestNwesRepository latestNwesRepository = LatestNwesRepository();

        // News ss = await latestNwesRepository.fetchLatestNews();

        // for (var i = 0; i < ss.news.length; i++) {
        //   print(ss.news[i].message.content);
        // }
      },
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        padding: EdgeInsets.all(15),
        height: 60,
        color: Style.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Novo Post",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            Container(width: 30),
            Icon(Icons.add_circle, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
