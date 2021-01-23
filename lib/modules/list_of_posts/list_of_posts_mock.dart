import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:mockito/mockito.dart';

import '../../models/post.dart';

class ListOfPostsMock extends Mock {
  Future<List<Post>> fetchListOfPosts() async {
    final json =
        jsonDecode(await rootBundle.loadString("lib/mocks/list_of_posts.json"));
    List<Post> listOfPOsts =
        (json as List).map((i) => Post.fromJson(i)).toList();
    return listOfPOsts;
  }
}
