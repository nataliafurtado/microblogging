import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microblogging/modules/list_of_posts/widget/page_edit_delete_post_on_edit.dart';
import 'package:microblogging/modules/list_of_posts/widget/page_imput_field_post_text.dart';
import 'package:provider/provider.dart';

import '../../assets/style.dart';
import '../../functions/functions.dart';
import '../../widgets/button.dart';
import 'list_of_posts_controller.dart';
import 'widget/camera_widget/camera_widget.dart';

class EditCreatePostPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double totalSizeOfAllWidgets = 710;
    ListOfPostsController controllerListOfPost =
        Provider.of<ListOfPostsController>(context, listen: false);
    log(flexHeightSpacing(context, 1).toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: flexHeightSpacing(context, 1) < totalSizeOfAllWidgets
              ? totalSizeOfAllWidgets
              : flexHeightSpacing(context, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DeletePostOnEdit(),
              CameraWidget(),
              Container(height: 60),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Texto do post:",
                  style: Style.formSubTitle,
                ),
              ),
              ImputFieldPosText(
                _formKey,
                controllerListOfPost.controllerText,
              ),
              Container(height: 60),
              Button("Salvar", () {
                if (_formKey.currentState.validate()) {
                  controllerListOfPost.saveEditPost();
                }
              }),
              Container(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
