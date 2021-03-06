import 'package:flutter/material.dart';

import '../../../../models/post.dart';

class PostCardImageTopPart3 extends StatelessWidget {
  final Post post;
  const PostCardImageTopPart3(
    this.post,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: loadImageLogic(),
      ),
    );
  }

  DecorationImage loadImageLogic() {
    if (post.imageString != null && post.imageString.isNotEmpty) {
      return DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            post.imageString,
          ));
    } else if (post.imageFile != null) {
      return DecorationImage(
        fit: BoxFit.cover,
        image: FileImage(
          post.imageFile,
        ),
      );
    } else {
      return null;
    }
  }
}
