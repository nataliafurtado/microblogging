import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../assets/constants.dart';
import '../../global_acess.dart';
import '../../widgets/title_widget.dart';
import 'list_of_posts_controller.dart';
import 'widget/dismissible_widget.dart';
import 'widget/post_card_widget/post_card_widget.dart';

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
          TitleWidget(
            Constants.microblogging,
            logout: Provider.of<GlobalAccess>(context, listen: false).logout,
          ),
          Expanded(
            child: ListView.builder(
                key: Key("list-posts"),
                padding: EdgeInsets.only(bottom: 80),
                itemCount: controllerListOfPosts.posts.length,
                itemBuilder: (ctx, index) {
                  return DismissibleWidget(
                    index: index,
                    postCard:
                        PostCard(controllerListOfPosts.posts[index], index),
                  );
                }),
          ),
        ],
      );
    });
  }
}
