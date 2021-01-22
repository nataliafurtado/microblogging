import 'package:flutter/material.dart';
import 'package:microblogging/modules/list/list_controller.dart';
import 'package:microblogging/widgets/chips_filter.dart';
import 'package:provider/provider.dart';

class FilterChipsStatus extends StatefulWidget {
  @override
  _FilterChipsStatusState createState() => _FilterChipsStatusState();
}

class _FilterChipsStatusState extends State<FilterChipsStatus> {
  ListController controllerList;
  @override
  Widget build(BuildContext context) {
    controllerList = Provider.of<ListController>(context, listen: false);
    return ChipsFilter(
      textDefault: controllerList.selectedFilterStatus,
      width: 150,
      onClick: _statusFilter,
    );
  }

  void _statusFilter(
    context,
  ) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              Container(
                  height: 400,
                  child: ListView.builder(
                      itemCount: controllerList.status.length + 1,
                      itemBuilder: (ctx, index) {
                        return index == controllerList.status.length
                            ? ListTile(
                                leading: new Icon(Icons.not_interested),
                                title: new Text("S.of(context).TODAS"),
                                onTap: () {
                                  Navigator.pop(context);
                                  controllerList.filterStatusCleanFilter();
                                },
                              )
                            : ListTile(
                                leading: new Icon(Icons.label_important),
                                title: new Text(
                                    controllerList.status[index].toUpperCase()),
                                onTap: () {
                                  Navigator.pop(context);
                                  controllerList.filterStatusActions(
                                      controllerList.status[index]);
                                },
                              );
                      })),
            ],
          );
        });
  }
}
