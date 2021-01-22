import 'package:flutter/material.dart';
import 'package:microblogging/assets/style.dart';
import 'package:provider/provider.dart';

import '../functions/functions.dart';
import '../modules/list/list_controller.dart';

class DropDownStatus extends StatefulWidget {
  @override
  _DropDownStatusState createState() => _DropDownStatusState();
}

class _DropDownStatusState extends State<DropDownStatus> {
  @override
  Widget build(BuildContext context) {
    ListController controllerList =
        Provider.of<ListController>(context, listen: false);
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: statusColors(controllerList.selectedStatus),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(0.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: DropdownButton<String>(
          items: controllerList.status.map((String val) {
            return new DropdownMenuItem<String>(
              value: val,
              child: Container(
                  width: flexWidthSpacing(context, 1) - 100,
                  alignment: Alignment.center,
                  child: Text(
                    val,
                    style: Style.bold,
                  )),
            );
          }).toList(),
          value: controllerList.selectedStatus,
          underline: Container(color: Colors.transparent),
          onChanged: (newVal) {
            controllerList.selectedStatus = newVal;
            this.setState(() {});
          }),
    );
  }
}
