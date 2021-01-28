import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../assets/style.dart';
import '../../list_of_posts_controller.dart';

class TrashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListOfPostsController controllerListOfPost =
        Provider.of<ListOfPostsController>(context, listen: false);
    return controllerListOfPost.indexToEdit != null
        ? InkWell(
            onTap: () {
              controllerListOfPost.deletePostOnEdit(context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              child: FaIcon(
                FontAwesomeIcons.trash,
                color: Style.secondaryColor,
              ),
            ),
          )
        : Container(height: 30);
  }
}
