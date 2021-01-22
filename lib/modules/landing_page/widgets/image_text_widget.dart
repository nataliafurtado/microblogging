import 'package:flutter/material.dart';
import 'package:microblogging/assets/style.dart';

class ImageTextWidget extends StatelessWidget {
  final String text;
  final String image;
  const ImageTextWidget({
    this.text,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 50),
        Text(
          text,
          style: Style.bold.copyWith(fontSize: 18),
        ),
        Container(height: 30),
        Image.asset(image),
      ],
    );
  }
}
