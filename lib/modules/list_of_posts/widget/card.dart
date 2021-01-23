import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../assets/constants.dart';
import '../../../assets/style.dart';
import '../../../functions/functions.dart';
import '../../../models/post.dart';
import '../list_of_posts_controller.dart';
import 'user_card.dart';

class PostCard extends StatelessWidget {
  final Post action;
  final int index;
  const PostCard(
    this.action,
    this.index,
  );

  final cardPadding = 15.0;

  @override
  Widget build(BuildContext context) {
    ListOfPostsController controllerList =
        Provider.of<ListOfPostsController>(context, listen: false);
    return InkWell(
      onTap: () {
        controllerList.goToEditPostPage(index);
      },
      onLongPress: () {
        controllerList.changeShowResponsableInCard();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: cardPadding,
          left: cardPadding,
          right: cardPadding,
        ),
        decoration: Style.cardDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserCard(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: cardTextsWidth(context),
                  child: Text(
                    action.who,
                    style: Style.cardTitle,
                    maxLines: 1,
                  ),
                ),
                Container(
                  child: Text(
                    convertDate(action.date),
                    style: Style.cardSubTitle,
                  ),
                ),
                Container(
                  width: cardTextsWidth(context),
                  child: Text(
                    action.text,
                    style: Style.cardText,
                  ),
                ),
                Container(height: 10),
              ],
            )
          ],
        ),
      ),
    );
  }

  double cardTextsWidth(context) {
    return flexWidthSpacing(context, 1) -
        (cardPadding * 2) -
        Constants.cardImageSizes;
  }
}
