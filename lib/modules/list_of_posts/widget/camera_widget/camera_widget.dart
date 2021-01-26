import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microblogging/functions/functions.dart';
import 'package:provider/provider.dart';

import '../../list_of_posts_controller.dart';
import 'image_container.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    ListOfPostsController controllerListOfPost =
        Provider.of<ListOfPostsController>(context, listen: false);
    return Observer(
      builder: (_) {
        return Container(
          width: flexWidthSpacing(context, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ImageContainer(),
                  if (hasImage(controllerListOfPost))
                    Positioned(
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
                        )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  hasImage(ListOfPostsController controllerListOfPost) {
    if (controllerListOfPost.imageString != null &&
        controllerListOfPost.imageString.isNotEmpty) return true;
    if (controllerListOfPost.imageFile != null) return true;
    return false;
  }
}
