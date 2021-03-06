import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../assets/constants.dart';
import '../../functions/functions.dart';
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
  String postCardOption = Constants.postCard2;

  @action
  fetchPosts() async {
    if (posts.isEmpty) {
      List<Post> postsList = await _listOfPostRepository.fetchListOsPosts();
      postsList.sort((Post a, Post b) =>
          DateTime.parse(a.date).compareTo(DateTime.parse(a.date)));
      posts = postsList;
      showdDismissibleWarn();
    }
  }

  showdDismissibleWarn() async {
    Future.delayed(Duration(seconds: 1));
    showToast("Arraste para o lado para excluir");
  }

  @action
  goToEditPostPage(int index) async {
    data = DateTime.now().toIso8601String();
    controllerText.text = posts[index].text;
    imageString = posts[index].imageString;
    isLoadingImage = false;
    indexToEdit = index;
    countTextLenght();
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  goToNewPostPage() async {
    data = DateTime.now().toIso8601String();
    indexToEdit = null;
    imageString = null;
    imageFile = null;
    isLoadingImage = false;
    controllerText.text = "";
    countTextLenght();
    Navigator.pushNamed(context, '/edit-create-post', arguments: this);
  }

  @action
  saveOrEditPost() async {
    isLoadingImage = false;
    if (indexToEdit != null) {
      saveEditPost();
    } else {
      await saveNewPost();
    }
  }

  @action
  saveNewPost() async {
    List<Post> postsList = posts;
    postsList.add(Post(
      date: data,
      text: controllerText.text,
      who: Provider.of<GlobalAccess>(context, listen: false).user.name,
      imageString: imageString ?? "",
      imageFile: imageFile,
    ));
    postsList.sort((Post a, Post b) =>
        DateTime.parse(a.date).compareTo(DateTime.parse(a.date)));
    posts = postsList;
    Navigator.pop(context);
    showToast("Post criado com sucesso");
  }

  saveEditPost() {
    posts[indexToEdit].text = controllerText.text;
    posts[indexToEdit].imageString = imageString ?? "";
    posts[indexToEdit].imageFile = imageFile;
    Navigator.pop(context);
    showToast("Post Editado com sucesso");
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

  countTextLenght() {
    loadcountDown(controllerText.text);
  }

  @action
  loadcountDown(String textPassed) {
    countDown = 280 - textPassed.length;
  }

  @action
  goToNextPostCardOption() {
    if (postCardOption == Constants.postCard2)
      postCardOption = Constants.postCard3;
    else if (postCardOption == Constants.postCard3)
      postCardOption = Constants.postCard2;

    Navigator.pop(context);
    showToast("Trocado modelo do card");
  }
}
