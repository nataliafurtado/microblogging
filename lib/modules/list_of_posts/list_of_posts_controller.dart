import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';

import '../../functions/functions.dart';
import '../../models/post.dart';
import '../../widgets/dialog_circular_progress_indicator.dart';
import 'list_of_posts_repository.dart';

part 'list_of_posts_controller.g.dart';

class ListOfPostsController = ListOfPostsControllerBase
    with _$ListOfPostsController;

abstract class ListOfPostsControllerBase with Store, ChangeNotifier {
  final BuildContext context;
  ListOfPostsControllerBase(this.context);

  ListOfPostsRepository _listOfPostRepository = ListOfPostsRepository();

  @observable
  List<Post> posts = [];

  TextEditingController controllerText = TextEditingController();
  int indexToEdit;
  String data;

  @action
  fetchPosts() async {
    if (posts.isEmpty) {
      posts = await _listOfPostRepository.fetchLatestNews();
    }
  }

  @action
  goToEditPostPage(int index) async {
    data = DateTime.now().toIso8601String();
    controllerText.text = posts[index].text;
    indexToEdit = index;
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  goToNewPostPage() async {
    data = DateTime.now().toIso8601String();
    indexToEdit = null;
    controllerText.text = "";
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  @action
  saveEditPost() async {
    if (indexToEdit != null) {
      posts[indexToEdit].text = controllerText.text;
    } else {
      await saveNewPost();
    }
    Navigator.pop(context);
  }

  saveNewPost() async {
    posts.add(Post(
      date: data,
      text: controllerText.text,
      who: "tttttt",
    ));
  }

  @action
  deletePost(int index) async {
    showCustomDialog(DialogCircularProgressIndicator());
    posts.removeAt(index);
    Navigator.pop(context);
  }

  @action
  changeShowResponsableInCard() {
    // isToShowResponsable = !isToShowResponsable;
  }
}
