import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assets/style.dart';
import '../../functions/functions.dart';
import '../../widgets/button.dart';
import 'list_of_posts_controller.dart';
import 'widget/camera_widget.dart';

class EditCreatePostPage extends StatelessWidget {
  final double totalSizeOfAllWidgets = 600;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: CameraWidget(),
              ),
              Container(height: 60),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Texto do post:",
                  style: Style.formSubTitle,
                ),
              ),
              Container(
                height: 180,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: controllerListOfPost.controllerText,
                    maxLines: 7,
                    decoration: Style.inputDecoration(),
                    validator: (String text) {
                      if (text.trim().isEmpty) {
                        return "Campo não pode ser vazio";
                      } else if (text.length > 281) {
                        return "Máximo de 280 caracteres";
                      }
                      return null;
                    },
                  ),
                ),
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
