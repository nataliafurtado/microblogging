import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microblogging/assets/constants.dart';
import 'package:microblogging/assets/style.dart';
import 'package:microblogging/functions/functions.dart';
import 'package:microblogging/modules/login/login_controller.dart';
import 'package:provider/provider.dart';

class LoginNewUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding + 3,
      ),
      width: flexWidthSpacing(context, 1),
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Provider.of<LoginController>(context, listen: false)
              .goToNewUSerPage();
        },
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.user,
                color: Style.secondaryColor,
                size: 15,
              ),
              Container(width: 5),
              Text(
                "Novo usuário",
                style: Style.cardSubTitle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
