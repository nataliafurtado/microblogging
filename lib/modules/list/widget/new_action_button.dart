import 'package:flutter/material.dart';
import 'package:microblogging/assets/style.dart';
import 'package:microblogging/modules/list/list_controller.dart';
import 'package:provider/provider.dart';

class NewActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListController controllerList =
        Provider.of<ListController>(context, listen: false);
    return InkWell(
      onTap: () {
        controllerList.goToNewActionEventPage();
      },
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        padding: EdgeInsets.all(15),
        height: 60,
        color: Style.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " S.of(context).NOVA_ACAO",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(width: 30),
            Icon(Icons.add_circle, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
