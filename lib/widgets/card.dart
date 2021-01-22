import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../assets/style.dart';
import '../functions/functions.dart';
import '../models/action.dart';
import '../modules/list/list_controller.dart';
import 'status.dart';

class CardAction extends StatelessWidget {
  final ActionEvent action;
  final int index;
  const CardAction(
    this.action,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    ListController controllerList =
        Provider.of<ListController>(context, listen: false);
    return InkWell(
      onTap: () {
        controllerList.goToEditActionEventPage(index);
      },
      onLongPress: () {
        controllerList.changeShowResponsableInCard();
      },
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        // padding: EdgeInsets.all(15),
        height: 150,
        decoration: Style.cardDecoration,
        child: Column(
          children: [
            dataCategoria(),
            ActionStatus(action.status),
            oque(controllerList),
            como(),
            Container(height: 10),
          ],
        ),
      ),
    );
  }

  Widget dataCategoria() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(formatData(action.prazo, true), style: Style.bold),
          Text(action.categoria.toUpperCase()),
        ],
      ),
    );
  }

  Widget oque(ListController controllerList) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            action.oQue,
            style: Style.bold,
          ),
          Observer(builder: (_) {
            return controllerList.isToShowResponsable
                ? Text(action.quem.toUpperCase())
                : Container();
          }),
        ],
      ),
    );
  }

  // Widget oque() {
  //   return Container(
  //     padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
  //     alignment: Alignment.centerLeft,
  //     child: Text(
  //       action.oQue,
  //       style: Style.bold,
  //     ),
  //   );
  // }

  Widget como() {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 10, right: 10),
      height: 30,
      alignment: Alignment.centerLeft,
      child: Text(
        action.como,
      ),
    );
  }
}
