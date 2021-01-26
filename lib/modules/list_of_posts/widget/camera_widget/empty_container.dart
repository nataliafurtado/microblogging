import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../assets/style.dart';
import '../../list_of_posts_controller.dart';

class EmptyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showPicker(Provider.of<ListOfPostsController>(context, listen: false),
            context);
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
