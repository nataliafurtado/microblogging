import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assets/style.dart';
import '../functions/functions.dart';
import '../modules/list/list_controller.dart';

class DropDownResponsable extends StatefulWidget {
  @override
  _DropDownResponsableState createState() => _DropDownResponsableState();
}

class _DropDownResponsableState extends State<DropDownResponsable> {
  @override
  Widget build(BuildContext context) {
    ListController controllerList =
        Provider.of<ListController>(context, listen: false);
    return Container(
      height: 60,
      child: InputDecorator(
        decoration: Style.inputDecoration(),
        child: DropdownButton<String>(
            items: controllerList.responsables.map((String val) {
              return new DropdownMenuItem<String>(
                value: val,
                child: Container(
                    width: flexWidthSpacing(context, 1) - 100,
                    alignment: Alignment.center,
                    child: Text(
                      val.toUpperCase(),
                      style: Style.bold,
                    )),
              );
            }).toList(),
            value: controllerList.selectedResponsable,
            underline: Container(color: Colors.transparent),
            onChanged: (newVal) {
              controllerList.selectedResponsable = newVal;
              this.setState(() {});
            }),
      ),
    );
  }
}
