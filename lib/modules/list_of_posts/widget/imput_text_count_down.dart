import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../assets/style.dart';
import '../list_of_posts_controller.dart';

class ImputTextCountDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        width: double.infinity,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 5),
        child: Text(
          Provider.of<ListOfPostsController>(context, listen: false)
              .countDown
              .toString(),
          style: Style.cardTitle,
        ),
      );
    });
  }
}
