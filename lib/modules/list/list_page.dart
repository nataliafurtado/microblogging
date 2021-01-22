import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:microblogging/modules/list/widget/new_action_button.dart';
import 'package:provider/provider.dart';

import '../../assets/style.dart';

import '../../widgets/button.dart';
import '../../widgets/card.dart';
import 'filter/filters.dart';
import 'list_controller.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ListController controllerList;
  @override
  void initState() {
    controllerList = Provider.of<ListController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controllerList.loadData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Style.iceBackground,
        body: Observer(builder: (_) {
          return Column(
            children: [
              Container(height: 20),
              //
              Container(
                height: 20,
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 60,
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.bottomRight,
                  // child: Icon(
                  //   Icons.settings,
                  //   color: Style.primaryColor,
                  // ),
                ),
              ),
              //
              Filters(),

              //
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    return controllerList.loadData();
                  },
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controllerList.actions.length + 1,
                      itemBuilder: (ctx, index) {
                        return index == controllerList.actions.length
                            ? NewActionButton()
                            : Dismissible(
                                dismissThresholds: {
                                    DismissDirection.endToStart: 0.9
                                  },
                                background: backGroudTrash(),
                                direction: DismissDirection.endToStart,
                                key: Key(index.toString()),
                                onDismissed: (direction) {
                                  controllerList.deleteactionEvent(index);
                                },
                                child: CardAction(
                                    controllerList.actions[index], index),
                                confirmDismiss: dialogShouldDismiss,
                                movementDuration: Duration(seconds: 1));
                      }),
                ),
              ),
              Container(height: 30),
            ],
          );
        }));
  }

  Container backGroudTrash() {
    return Container(
      color: Style.atrasada,
      alignment: Alignment(0.9, 0),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Future<bool> dialogShouldDismiss(DismissDirection direction) async {
    return await showDialog(
        context: context,
        child: AlertDialog(
          content: Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "S.of(context).DESEJA_EXCLUIR",
                  style: Style.bold,
                ),
                Container(height: 20),
                Button("S.of(context).EXCLUIR", () {
                  Navigator.of(context).pop(true);
                }),
                Container(height: 20),
                Button("S.of(context).CANCELAR", () {
                  Navigator.of(context).pop(false);
                }),
                Container(height: 20),
                Text(
                  "*Esta ação não pode ser desfeita ",
                ),
              ],
            ),
          ),
        ));
  }
}
