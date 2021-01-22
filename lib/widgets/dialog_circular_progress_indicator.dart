import 'package:flutter/material.dart';

class DialogCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
