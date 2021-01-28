import 'package:flutter/material.dart';

import '../../../../models/post.dart';

class PostCardImageTopPart2 extends StatelessWidget {
  final Post post;
  const PostCardImageTopPart2(
    this.post,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
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
