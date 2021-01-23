import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assets/style.dart';
import '../../widgets/button.dart';
import 'list_of_posts_controller.dart';

class EditCreatePostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListOfPostsController controllerListOfPost =
        Provider.of<ListOfPostsController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 50),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Texto do post:",
                  style: Style.formSubTitle,
                ),
              ),
              TextFormField(
                controller: controllerListOfPost.controllerText,
                maxLines: 3,
                decoration: Style.inputDecoration(),
              ),
              Container(height: 10),
              Container(height: 40),
              Button("Salvar", () {
                controllerListOfPost.saveEditPost();
              }),
              Container(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
