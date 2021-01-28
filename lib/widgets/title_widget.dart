import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../assets/style.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final Function logout;
  final Function changePostCardModel;
  TitleWidget(
    this.text, {
    this.logout,
    this.changePostCardModel,
  });

  final Widget spaceAux = Container(
    width: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          spaceAux,
          Text(
            text,
            style: Style.titleFont,
          ),
          logout == null
              ? spaceAux
              : InkWell(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: FaIcon(
                      FontAwesomeIcons.ellipsisV,
                      color: Style.detailDarkestColor,
                      size: 15,
                    ),
                  ),
                )
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.signOutAlt,
                        color: Style.detailColor,
                        size: 25,
                      ),
                      title: new Text('Sair'),
                      onTap: () {
                        logout(context);
                      }),
                  if (changePostCardModel != null)
                    new ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.exchangeAlt,
                          color: Style.detailColor,
                          size: 25,
                        ),
                        title: new Text('Mudar modelo do card de posts'),
                        onTap: () {
                          changePostCardModel();
                        }),
                ],
              ),
            ),
          );
        });
  }
}
