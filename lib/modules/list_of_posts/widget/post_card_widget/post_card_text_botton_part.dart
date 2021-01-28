import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../assets/style.dart';
import '../../../../models/post.dart';

class PostCardTextBottonPart extends StatelessWidget {
  final Post post;
  const PostCardTextBottonPart(
    this.post,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              post.who,
              style: Style.cardTitle,
              maxLines: 1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              post.text,
              style: Style.cardText,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                child: Text(
                  DateFormat("d 'de' MMMM 'de' y", "pt_BR")
                      .format(DateTime.parse(post.date)),

                  // convertDate(post.date),
                  style: Style.cardSubTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
