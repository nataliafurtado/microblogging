import 'package:flutter/material.dart';
import 'package:microblogging/modules/list/list_controller.dart';
import 'package:microblogging/modules/list/list_page.dart';
import 'package:provider/provider.dart';

class ListProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListController>(
      create: (context) => ListController(context),
      child: ListPage(),
    );
  }
}
