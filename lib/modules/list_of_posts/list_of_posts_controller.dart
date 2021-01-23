import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  @observable
  String imageString;

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
    imageString = posts[index].image;

    indexToEdit = index;
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  goToNewPostPage() async {
    data = DateTime.now().toIso8601String();
    indexToEdit = null;
    imageString = null;
    controllerText.text = "";
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  @action
  saveEditPost() async {
    if (indexToEdit != null) {
      posts[indexToEdit].text = controllerText.text;
      posts[indexToEdit].image = imageString ?? "";
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
      image: imageString ?? "",
    ));
  }

  @action
  imgFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) imageString = pickedFile.path;
  }

  @action
  imgFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) imageString = pickedFile.path;
  }

  @action
  deleteImage() {
    imageString = null;
  }

  @action
  deletePost(int index) async {
    List<Post> listPostsAux = posts;
    listPostsAux.removeAt(index);
    posts = listPostsAux;
  }
}
