import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microblogging/modules/list_of_posts/list_of_posts_controller.dart';
import 'package:provider/provider.dart';

class DeleteImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListOfPostsController controllerListOfPost =
        Provider.of<ListOfPostsController>(context, listen: false);
    return Observer(builder: (_) {
      return hasImage(controllerListOfPost)
          ? Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 80,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    controllerListOfPost.deleteImage();
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Container(
                      child: FaIcon(
                        FontAwesomeIcons.timesCircle,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ))
          : Container();
    });
  }

  hasImage(ListOfPostsController controllerListOfPost) {
    if (controllerListOfPost.imageString != null &&
        controllerListOfPost.imageString.isNotEmpty) return true;
    if (controllerListOfPost.imageFile != null) return true;
    return false;
  }
}
