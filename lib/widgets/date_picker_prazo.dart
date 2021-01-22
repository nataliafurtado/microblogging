import 'package:flutter/material.dart';
import 'package:microblogging/assets/style.dart';
import 'package:microblogging/functions/functions.dart';
import 'package:microblogging/modules/list/list_controller.dart';
import 'package:provider/provider.dart';

class DatePickerPrazo extends StatefulWidget {
  @override
  _DatePickerPrazoState createState() => _DatePickerPrazoState();
}

class _DatePickerPrazoState extends State<DatePickerPrazo> {
  @override
  Widget build(BuildContext context) {
    ListController controllerList =
        Provider.of<ListController>(context, listen: false);
    return InkWell(
      onTap: () {
        _selectDate(context, controllerList);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: controllerList.prazo.isEmpty
                ? Colors.indigo[100]
                : prazoColors(DateTime.parse(controllerList.prazo))),
        alignment: Alignment.center,
        child: Text(
          formatData(controllerList.prazo, true),
          style: Style.white,
        ),
      ),
    );
  }

  _selectDate(BuildContext context, ListController controllerList) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: controllerList.prazo.isEmpty
          ? DateTime.now()
          : DateTime.parse(controllerList.prazo), // Refer step 1
      firstDate: DateTime.now().add(Duration(days: -10)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null)
      setState(() {
        controllerList.prazo = picked.toIso8601String();
      });
  }
}
