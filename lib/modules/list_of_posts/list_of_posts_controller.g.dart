// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_posts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListOfPostsController on ListOfPostsControllerBase, Store {
  final _$postsAtom = Atom(name: 'ListOfPostsControllerBase.posts');

  @override
  List<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$imageStringAtom = Atom(name: 'ListOfPostsControllerBase.imageString');

  @override
  String get imageString {
    _$imageStringAtom.reportRead();
    return super.imageString;
  }

  @override
  set imageString(String value) {
    _$imageStringAtom.reportWrite(value, super.imageString, () {
      super.imageString = value;
    });
  }

  final _$imageFileAtom = Atom(name: 'ListOfPostsControllerBase.imageFile');

  @override
  File get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$isLoadingImageAtom =
      Atom(name: 'ListOfPostsControllerBase.isLoadingImage');

  @override
  bool get isLoadingImage {
    _$isLoadingImageAtom.reportRead();
    return super.isLoadingImage;
  }

  @override
  set isLoadingImage(bool value) {
    _$isLoadingImageAtom.reportWrite(value, super.isLoadingImage, () {
      super.isLoadingImage = value;
    });
  }

  final _$countDownAtom = Atom(name: 'ListOfPostsControllerBase.countDown');

  @override
  int get countDown {
    _$countDownAtom.reportRead();
    return super.countDown;
  }

  @override
  set countDown(int value) {
    _$countDownAtom.reportWrite(value, super.countDown, () {
      super.countDown = value;
    });
  }

  final _$postCardOptionAtom =
      Atom(name: 'ListOfPostsControllerBase.postCardOption');

  @override
  String get postCardOption {
    _$postCardOptionAtom.reportRead();
    return super.postCardOption;
  }

  @override
  set postCardOption(String value) {
    _$postCardOptionAtom.reportWrite(value, super.postCardOption, () {
      super.postCardOption = value;
    });
  }

  final _$fetchPostsAsyncAction =
      AsyncAction('ListOfPostsControllerBase.fetchPosts');

  @override
  Future fetchPosts() {
    return _$fetchPostsAsyncAction.run(() => super.fetchPosts());
  }

  final _$goToEditPostPageAsyncAction =
      AsyncAction('ListOfPostsControllerBase.goToEditPostPage');

  @override
  Future goToEditPostPage(int index) {
    return _$goToEditPostPageAsyncAction
        .run(() => super.goToEditPostPage(index));
  }

  final _$saveEditPostAsyncAction =
      AsyncAction('ListOfPostsControllerBase.saveEditPost');

  @override
  Future saveEditPost() {
    return _$saveEditPostAsyncAction.run(() => super.saveEditPost());
  }

  final _$imgFromCameraAsyncAction =
      AsyncAction('ListOfPostsControllerBase.imgFromCamera');

  @override
  Future imgFromCamera() {
    return _$imgFromCameraAsyncAction.run(() => super.imgFromCamera());
  }

  final _$imgFromGalleryAsyncAction =
      AsyncAction('ListOfPostsControllerBase.imgFromGallery');

  @override
  Future imgFromGallery() {
    return _$imgFromGalleryAsyncAction.run(() => super.imgFromGallery());
  }

  final _$deletePostAsyncAction =
      AsyncAction('ListOfPostsControllerBase.deletePost');

  @override
  Future deletePost(int index) {
    return _$deletePostAsyncAction.run(() => super.deletePost(index));
  }

  final _$ListOfPostsControllerBaseActionController =
      ActionController(name: 'ListOfPostsControllerBase');

  @override
  dynamic deleteImage() {
    final _$actionInfo = _$ListOfPostsControllerBaseActionController
        .startAction(name: 'ListOfPostsControllerBase.deleteImage');
    try {
      return super.deleteImage();
    } finally {
      _$ListOfPostsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loadcountDown(String textPassed) {
    final _$actionInfo = _$ListOfPostsControllerBaseActionController
        .startAction(name: 'ListOfPostsControllerBase.loadcountDown');
    try {
      return super.loadcountDown(textPassed);
    } finally {
      _$ListOfPostsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goToNextPostCardOption() {
    final _$actionInfo = _$ListOfPostsControllerBaseActionController
        .startAction(name: 'ListOfPostsControllerBase.goToNextPostCardOption');
    try {
      return super.goToNextPostCardOption();
    } finally {
      _$ListOfPostsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts},
imageString: ${imageString},
imageFile: ${imageFile},
isLoadingImage: ${isLoadingImage},
countDown: ${countDown},
postCardOption: ${postCardOption}
    ''';
  }
}
