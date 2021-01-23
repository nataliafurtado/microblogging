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
  String toString() {
    return '''
posts: ${posts},
imageString: ${imageString}
    ''';
  }
}
