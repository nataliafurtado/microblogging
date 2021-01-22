import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/chips_filter.dart';
import '../../list_controller.dart';

class FilterChipsResponsable extends StatefulWidget {
  @override
  _FilterChipsResponsableState createState() => _FilterChipsResponsableState();
}

class _FilterChipsResponsableState extends State<FilterChipsResponsable> {
  ListController controllerList;
  @override
  Widget build(BuildContext context) {
    controllerList = Provider.of<ListController>(context, listen: false);
    return ChipsFilter(
      textDefault: controllerList.selectedResponsable,
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
                      itemCount: controllerList.responsables.length + 1,
                      itemBuilder: (ctx, index) {
                        return index == controllerList.responsables.length
                            ? ListTile(
                                leading: new Icon(Icons.not_interested),
                                title: new Text("S.of(context).TODAS"),
                                onTap: () {
                                  Navigator.pop(context);
                                  controllerList.filterResponsableCleanFilter();
                                },
                              )
                            : ListTile(
                                leading: new Icon(Icons.person),
                                title: new Text(controllerList
                                    .responsables[index]
                                    .toUpperCase()),
                                onTap: () {
                                  Navigator.pop(context);
                                  controllerList.filterResponsableActions(
                                      controllerList.responsables[index]);
                                },
                              );
                      })),
            ],
          );
        });
  }
}
