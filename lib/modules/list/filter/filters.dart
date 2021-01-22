import 'package:flutter/material.dart';
import 'package:microblogging/modules/list/filter/widgets/filter_chips_responsable.dart';
import 'package:provider/provider.dart';

import '../list_controller.dart';
import 'widgets/filter_chips_status.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  ListController controllerList;
  @override
  void initState() {
    controllerList = Provider.of<ListController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            FilterChipsStatus(),
            Container(width: 16),
            FilterChipsResponsable(),
            Container(width: 8),
          ],
        ),
      ),
    );
  }
}
