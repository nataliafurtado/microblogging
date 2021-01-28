import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assets/style.dart';
import '../../functions/functions.dart';
import '../../widgets/button.dart';
import 'list_of_posts_controller.dart';
import 'widget/app_bar_page_edit_create/app_bar_edit_create.dart';
import 'widget/camera_widget/image_widget.dart';
import 'widget/imput_text_count_down.dart';
import 'widget/page_imput_field_post_text.dart';

class EditCreatePostPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double totalSizeOfAllWidgets = 730;
    ListOfPostsController controllerListOfPost =
        Provider.of<ListOfPostsController>(context, listen: false);
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
              AppBarEditCreate(),
              ImageWidget(),
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
              ImputTextCountDown(),
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
