import 'package:flutter/material.dart';
import 'package:microblogging/assets/style.dart';

import 'package:microblogging/modules/list/list_controller.dart';
import 'package:microblogging/widgets/button.dart';
import 'package:microblogging/widgets/date_picker_prazo.dart';
import 'package:microblogging/widgets/drop_down_responsable.dart';
import 'package:microblogging/widgets/drop_down_status.dart';
import 'package:provider/provider.dart';

class ActionEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListController controllerList =
        Provider.of<ListController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 50),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text("S.of(context).CATEGORIA")),
              TextFormField(
                controller: controllerList.controllerCategoria,
                decoration: Style.inputDecoration(),
              ),
              Container(height: 10),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text("S.of(context).O_QUE")),
              TextFormField(
                controller: controllerList.controllerOque,
                decoration: Style.inputDecoration(),
              ),
              //
              Container(height: 10),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text("S.of(context).COMO")),
              TextFormField(
                controller: controllerList.controllerComo,
                decoration: Style.inputDecoration(),
                maxLines: 5,
              ),
              //
              Container(height: 10),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text("S.of(context).QUEM")),
              DropDownResponsable(),
              //
              Container(height: 20),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text("S.of(context).PRAZO")),
              //
              DatePickerPrazo(),
              //
              Container(height: 10),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text("S.of(context).SATUS")),
              DropDownStatus(),
              //
              Container(height: 10),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text("S.of(context).FEED_BACK")),
              TextFormField(
                controller: controllerList.controllerFeedBack,
                decoration: Style.inputDecoration(),
                maxLines: 3,
              ),
              //
              Container(height: 10),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text("S.of(context).OBS")),
              TextFormField(
                controller: controllerList.controllerObs,
                decoration: Style.inputDecoration(),
                maxLines: 3,
              ),
              Container(height: 40),
              Button("S.of(context).SALVAR", () {
                controllerList.saveActionEvent();
              }),
              Container(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
