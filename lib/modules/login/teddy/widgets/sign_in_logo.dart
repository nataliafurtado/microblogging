import 'package:flutter/material.dart';

import '../../../../assets/image_path.dart';
import '../../../../functions/functions.dart';

class SignInLogo extends StatelessWidget {
  final double logoImageProporcion = 1.9406;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: flexWidthSpacing(context, 1),
      height: flexWidthSpacing(context, 1) / logoImageProporcion,
      child: FittedBox(
        child: Image.asset(ImagePath.logoLogin),
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
