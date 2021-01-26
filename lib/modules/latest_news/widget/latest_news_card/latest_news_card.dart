import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets/constants.dart';
import '../../../../assets/style.dart';
import '../../../../models/latest_news.dart';

class LatestNewsCard extends StatelessWidget {
  final LatestNews latestNews;

  const LatestNewsCard(
    this.latestNews,
  );

  @override
  Widget build(BuildContext context) {
    // ListOfPostsController controllerList =
    // Provider.of<ListOfPostsController>(context, listen: false);
    return Column(
      children: [
        InkWell(
          // onTap: () => controllerList.goToEditPostPage(index),
          child: Container(
            margin: EdgeInsets.only(
              top: Constants.padding,
              left: Constants.padding,
              right: Constants.padding,
            ),
            decoration: Style.cardDecoration,
            child: Column(
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(latestNews.user.name),
                ),
                Container(
                  child: CachedNetworkImage(
                    // imageUrl: latestNews.user.profilePicture,
                    imageUrl:
                        "https://pbs.twimg.com/profile_images/1240676323913347074/Gg09hEPx_400x400.jpg",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Container(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text(latestNews.message.content),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
