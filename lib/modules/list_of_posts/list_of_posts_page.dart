import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../assets/constants.dart';
import '../../assets/style.dart';
import '../../widgets/button.dart';
import '../../widgets/title_widget.dart';
import 'list_of_posts_controller.dart';
import 'widget/post_card_widget/post_card_widget.dart';
import 'widget/trash_background.dart';

class ListOfPostsPage extends StatefulWidget {
  @override
  _ListOfPostsPageState createState() => _ListOfPostsPageState();
}

class _ListOfPostsPageState extends State<ListOfPostsPage> {
  ListOfPostsController controllerListOfPosts;
  @override
  void initState() {
    controllerListOfPosts =
        Provider.of<ListOfPostsController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controllerListOfPosts.fetchPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          Container(height: 40),
          Hero(
            tag: "title",
            child: TitleWidget(
              Constants.microblogging,
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controllerListOfPosts.posts.length,
                itemBuilder: (ctx, index) {
                  return Dismissible(
                      dismissThresholds: {DismissDirection.endToStart: 0.9},
                      background: TrashBackground(),
                      direction: DismissDirection.endToStart,
                      key: Key(controllerListOfPosts.posts[index].text +
                          index.toString()),
                      onDismissed: (direction) {
                        controllerListOfPosts.deletePost(index);
                      },
                      child:
                          PostCard(controllerListOfPosts.posts[index], index),
                      confirmDismiss: dialogShouldDismiss,
                      movementDuration: Duration(seconds: 1));
                }),
          ),
          Container(
            height: Constants.padding,
          ),
        ],
      );
    });
  }

  Future<bool> dialogShouldDismiss(DismissDirection direction) async {
    return await showDialog(
        context: context,
        child: AlertDialog(
          content: Container(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tem certeza que deseja excluir esse post ?",
                  style: Style.cardText,
                ),
                Container(height: 20),
                Button("Excluir", () {
                  Navigator.of(context).pop(true);
                }),
                Container(height: 20),
                Button("Cancelar", () {
                  Navigator.of(context).pop(false);
                }),
                Container(height: 20),
                Text(
                  "*Esta ação não pode ser desfeita ",
                  style: Style.cardText,
                ),
              ],
            ),
          ),
        ));
  }
}
