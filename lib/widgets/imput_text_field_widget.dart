import 'package:flutter/material.dart';
import 'package:microblogging/assets/style.dart';

class ImputTextFieldWidget extends StatelessWidget {
  final Key keyPassed;
  final TextEditingController controller;
  final String hint;
  final String label;
  final Function validator;
  final bool obscureText;
  const ImputTextFieldWidget({
    this.keyPassed,
    this.controller,
    this.hint,
    this.label,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: keyPassed,
      obscureText: obscureText,
      controller: controller,
      decoration: Style.inputDecoration(hint: hint, label: label),
      validator: validator,
    );
  }
}
