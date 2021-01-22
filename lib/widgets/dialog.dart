import 'package:flutter/material.dart';

class DialogTeste extends StatelessWidget {
  final String teste;
  const DialogTeste({
    this.teste,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Center(
          child: Text(teste),
        ),
      ),
    );
  }
}
