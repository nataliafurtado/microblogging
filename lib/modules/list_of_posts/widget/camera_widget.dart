import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../assets/style.dart';
import '../../../functions/functions.dart';
import '../list_of_posts_controller.dart';

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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              children: <Widget>[
                imageContainer(controllerListOfPost, context),
                if (controllerListOfPost.imageString != null ||
                    controllerListOfPost.imageFile != null)
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

                //
              ],
            ),
          ],
        );
      },
    );
  }

  Widget imageContainer(controllerListOfPost, context) {
    return ClipOval(
        child: Container(
      height: flexWidthSpacing(context, 1) / 2,
      width: flexWidthSpacing(context, 1) / 2,
      child: showImage(controllerListOfPost, context),
    ));
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
      return InkWell(
        onTap: () {
          _showPicker(controllerListOfPost, context);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Style.primaryColor,
              )),
          alignment: Alignment.center,
          child: Container(
            child: FaIcon(
              FontAwesomeIcons.camera,
              color: Style.detailColor,
              size: 50,
            ),
          ),
        ),
      );
    }
  }

  void _showPicker(ListOfPostsController controllerListOfPost, context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Galeria de fotos'),
                      onTap: () {
                        controllerListOfPost.imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Câmera'),
                    onTap: () {
                      controllerListOfPost.imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
