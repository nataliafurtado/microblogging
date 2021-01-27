import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../assets/style.dart';
import 'teddy_controller.dart';

class Teddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: Style.iceBackground,
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: FlareActor(
          "lib/assets/Teddy.flr",
          shouldClip: false,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
          controller: Provider.of<TeddyController>(context, listen: false),
        ));
  }
}
