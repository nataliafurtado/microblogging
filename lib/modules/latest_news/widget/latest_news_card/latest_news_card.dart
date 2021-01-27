import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets/constants.dart';
import '../../../../assets/style.dart';
import '../../../../assets/style.dart';
import '../../../../assets/style.dart';
import '../../../../models/latest_news.dart';

class LatestNewsCard extends StatelessWidget {
  final LatestNews latestNews;

  const LatestNewsCard(
    this.latestNews,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                child: Text(
                  latestNews.user.name,
                  style: Style.cardTitle,
                ),
              ),
              Container(
                child: CachedNetworkImage(
                  imageUrl: latestNews.user.profilePicture,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Container(
                    padding: EdgeInsets.all(10),
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      "lib/assets/images/bot2.png",
                      color: Style.primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  latestNews.message.content,
                  style: Style.cardText,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
