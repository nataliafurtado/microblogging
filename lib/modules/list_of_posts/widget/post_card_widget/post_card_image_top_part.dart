import 'package:flutter/material.dart';

class PostCardImageTopPart extends StatelessWidget {
  final String image;
  const PostCardImageTopPart(
    this.image,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        image: image.isEmpty
            ? null
            : DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image,
                )),
      ),
    );
  }
}
