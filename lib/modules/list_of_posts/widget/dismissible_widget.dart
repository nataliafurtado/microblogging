import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../assets/style.dart';
import '../../../widgets/button.dart';
import '../list_of_posts_controller.dart';
import 'page_dismissible_trash_background.dart';

class DismissibleWidget extends StatefulWidget {
  final int index;
  final Widget postCard;
  const DismissibleWidget({
    this.index,
    this.postCard,
  });

  @override
  _DismissibleWidgetState createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  ListOfPostsController controllerListOfPosts;
  @override
  void initState() {
    controllerListOfPosts =
        Provider.of<ListOfPostsController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(controllerListOfPosts.posts[widget.index].text +
            widget.index.toString()),
        dismissThresholds: {DismissDirection.endToStart: 0.8},
        background: DismissibleTrashBackground(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          controllerListOfPosts.deletePost(widget.index);
        },
        child: widget.postCard,
        confirmDismiss: dialogShouldDismiss,
        movementDuration: Duration(seconds: 1));
  }

  Future<bool> dialogShouldDismiss(DismissDirection direction) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
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
          );
        });
  }
}
