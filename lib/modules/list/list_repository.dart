import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../functions/functions.dart';
import '../../global_acess.dart';
import '../../models/action.dart';
import '../../services/navigator_sergice.dart';
import '../../widgets/dialog.dart';

class ListRepository {
  // Future<List<ActionEvent>> loadActionEvents() async {
  //   String url = Provider.of<GlobalAccess>(
  //           NavigationService.getNavigator().currentState.context,
  //           listen: false)
  //       .controllerIdSheet
  //       .text;

  // List<ActionEvent> newList = [];
  // var response = await http.get(url);
  // if (response.statusCode == 200 && response.body.isNotEmpty) {
  //   List<dynamic> j = convert.jsonDecode(response.body);
  //   for (var i = 0; i < j.length; i++) {
  //     newList.add(ActionEvent.fromJson(j[i], i));
  //   }
  // } else if (response.statusCode == 200) {
  // } else {
  //   print("Dialog ocorreu um erro");
  //   showCustomDialog(DialogTeste(
  //     teste: "Ups! Algo deu errado",
  //   ));
  // }
  // return newList;
}

Future<bool> doPost(ActionEvent actionEvent) async {
  //   String url = Provider.of<GlobalAccess>(
  //           NavigationService.getNavigator().currentState.context,
  //           listen: false)
  //       .controllerIdSheet
  //       .text;

  //   var response = await http.post(url, body: actionEvent.toJson());
  //   if (response.statusCode == 200 && response.statusCode == 302) {
  //     return true;
  //   } else {
  //     // showCustomDialog(DialogTeste(
  //     //   teste: "Ups! Algo deu errado",
  //     // ));
  //     return false;
  //   }
  // }
}
