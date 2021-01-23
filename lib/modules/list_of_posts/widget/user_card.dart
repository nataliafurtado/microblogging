import 'package:flutter/material.dart';
import 'package:microblogging/assets/constants.dart';
import 'package:microblogging/assets/style.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.cardImageSizes,
      width: Constants.cardImageSizes,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.account_circle,
            color: Style.detailColor,
            size: 60,
          ),
        ),
      ),
    );
  }
}
