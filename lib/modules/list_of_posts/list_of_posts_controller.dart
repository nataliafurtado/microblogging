import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:microblogging/assets/constants.dart';
import 'package:mobx/mobx.dart';
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
  @observable
  int countDown = 280;
  @observable
  String postCardOption = Constants.postCard3;

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
    coutTextLenght();
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  goToNewPostPage() async {
    data = DateTime.now().toIso8601String();
    indexToEdit = null;
    imageString = null;
    imageFile = null;
    isLoadingImage = false;
    controllerText.text = "";
    coutTextLenght();
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

  deletePostOnEdit(indexPassed) async {
    await deletePost(indexToEdit);
    Navigator.pop(indexPassed);
  }

  coutTextLenght() {
    loadcountDown(controllerText.text);
  }

  @action
  loadcountDown(String textPassed) {
    print(textPassed);
    countDown = 280 - textPassed.length;
  }

  @action
  goToNextPostCardOption() {
    if (postCardOption == Constants.postCard)
      postCardOption = Constants.postCard2;
    else if (postCardOption == Constants.postCard2)
      postCardOption = Constants.postCard3;
    else if (postCardOption == Constants.postCard3)
      postCardOption = Constants.postCard;

    Navigator.pop(context);
  }
}
