import 'package:flutter/material.dart';

import '../../../assets/style.dart';

class TrashBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.secondaryColor,
      margin: EdgeInsets.only(top: 15),
      alignment: Alignment(0.9, 0),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
