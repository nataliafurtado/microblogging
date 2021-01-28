import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../assets/constants.dart';
import '../../../../assets/style.dart';
import '../../../../models/post.dart';
import '../../list_of_posts_controller.dart';
import 'post_card_image_top_part3.dart';
import 'post_card_text_botton_part3.dart';

class PostCard3 extends StatelessWidget {
  final Post post;
  final int index;
  const PostCard3(
    this.post,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    ListOfPostsController controllerList =
        Provider.of<ListOfPostsController>(context, listen: false);
    return InkWell(
      onTap: () => controllerList.goToEditPostPage(index),
      child: Container(
        margin: EdgeInsets.only(
          top: Constants.padding,
          left: Constants.padding,
          right: Constants.padding,
        ),
        decoration: Style.cardDecoration,
        child: Column(
          children: [
            PostCardImageTopPart3(post),
            PostCardTextBottonPart3(post),
          ],
        ),
      ),
    );
  }
}
