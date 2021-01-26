import 'package:flutter/material.dart';

import 'package:microblogging/assets/style.dart';

class ImputFieldPosText extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controllerText;
  const ImputFieldPosText(
    this.formKey,
    this.controllerText,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controllerText,
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
    );
  }
}
