import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../functions/functions.dart';
import '../landing_page_controller.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final double totalSizeOfAllWidgets = 750;
  LandingPageController controllerGlobalAcess;
  @override
  void initState() {
    controllerGlobalAcess =
        Provider.of<LandingPageController>(context, listen: false);
    controllerGlobalAcess.initLogic(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100),
            configurationsText(context),
            Text("Splash creen icon e nat info"),
            Container(height: 30),
            Container(child: Image.asset('lib/assets/images/page00.png')),
            Container(
                height: calculateBottonButtonsBottonDistance(
                    context, totalSizeOfAllWidgets)),
          ],
        ),
      ),
    );
  }

  Widget configurationsText(context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width: double.infinity,
          //   alignment: Alignment.center,
          //   child: Text(
          //     S.of(context).PARA_CONFIGURAR_E_NEC,
          //     style: Style.bold.copyWith(fontSize: 23),
          //   ),
          // ),
          // Text(
          //   S.of(context).E_PRECISO_UMA,
          //   style: Style.bold.copyWith(fontSize: 17),
          // ),
          // Text(
          //   S.of(context).CRIAR_UMA_PLANILHA,
          //   style: Style.bold.copyWith(fontSize: 17),
          // ),
          // Text(
          //   S.of(context).IR_NA_PARTE,
          //   style: Style.bold.copyWith(fontSize: 17),
          // ),
          // Text(
          //   S.of(context).IMPALNTAR_O_SCRIP,
          //   style: Style.bold.copyWith(fontSize: 17),
          // ),
          // Text(
          //   S.of(context).LIBERAR_O_ACESSO,
          //   style: Style.bold.copyWith(fontSize: 17),
          // ),
        ],
      ),
    );
  }
}
