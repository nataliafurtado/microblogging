import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../global_acess.dart';
import '../../models/post.dart';
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
  @observable
  File imageFile;
  @observable
  bool isLoadingImage = false;

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
    imageString = posts[index].imageString;
    isLoadingImage = false;
    indexToEdit = index;
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  goToNewPostPage() async {
    data = DateTime.now().toIso8601String();
    indexToEdit = null;
    imageString = null;
    imageFile = null;
    isLoadingImage = false;
    controllerText.text = "";
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  @action
  saveEditPost() async {
    isLoadingImage = false;
    if (indexToEdit != null) {
      posts[indexToEdit].text = controllerText.text;
      posts[indexToEdit].imageString = imageString ?? "";
      posts[indexToEdit].imageFile = imageFile;
    } else {
      await saveNewPost();
    }
    Navigator.pop(context);
  }

  saveNewPost() async {
    posts.add(Post(
      date: data,
      text: controllerText.text,
      who: Provider.of<GlobalAccess>(context, listen: false).user.name,
      imageString: imageString ?? "",
      imageFile: imageFile,
    ));
  }

  @action
  imgFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    isLoadingImage = true;
    await Future.delayed(Duration(seconds: 2));
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    isLoadingImage = false;
  }

  @action
  imgFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    isLoadingImage = true;
    await Future.delayed(Duration(seconds: 2));
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    isLoadingImage = false;
  }

  @action
  deleteImage() {
    imageString = null;
    imageFile = null;
  }

  @action
  deletePost(int index) async {
    List<Post> listPostsAux = posts;
    listPostsAux.removeAt(index);
    posts = listPostsAux;
  }
}
