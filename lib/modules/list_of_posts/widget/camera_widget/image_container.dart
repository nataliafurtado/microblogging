import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../functions/functions.dart';
import '../../list_of_posts_controller.dart';
import 'empty_container.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListOfPostsController controllerListOfPost =
        Provider.of<ListOfPostsController>(context, listen: false);
    return ClipOval(
        child: Container(
      height: flexWidthSpacing(context, 1) / 2,
      width: flexWidthSpacing(context, 1) / 2,
      child: showImage(controllerListOfPost, context),
    ));
    ;
  }

  Widget showImage(ListOfPostsController controllerListOfPost, context) {
    if (controllerListOfPost.isLoadingImage) {
      return Container(
        child: CircularProgressIndicator(),
      );
    } else if (controllerListOfPost.imageString != null &&
        controllerListOfPost.imageString.isNotEmpty) {
      return Image.asset(
        controllerListOfPost.imageString,
        fit: BoxFit.cover,
      );
    } else if (controllerListOfPost.imageFile != null) {
      return Image.file(
        controllerListOfPost.imageFile,
        fit: BoxFit.cover,
      );
    } else {
      return EmptyContainer();
    }
  }
}
