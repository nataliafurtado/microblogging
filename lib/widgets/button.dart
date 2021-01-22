import 'package:flutter/material.dart';
import 'package:microblogging/assets/style.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onClick;
  const Button(
    this.text,
    this.onClick,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 56,
        decoration: Style.buttonDecoration,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Style.white,
        ),
      ),
    );
  }
}
