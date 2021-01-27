import 'package:flutter/material.dart';

import '../../../../functions/functions.dart';
import 'delete_image.dart';
import 'image_container.dart';

class ImageWidget extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: flexWidthSpacing(context, 1),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ImageContainer(),
              DeleteImage(),
            ],
          ),
        ],
      ),
    );
  }
}
