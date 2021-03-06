import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:microblogging/assets/style.dart';

import '../services/navigator_sergice.dart';

double flexHeightSpacing(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * value;
}

double flexWidthSpacing(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * value;
}

String convertDate(String datePassed) {
  DateTime brazilianDate = DateTime.parse(datePassed);
  return DateFormat('dd/MM/yyyy HH:mm').format(brazilianDate);
}

void showCustomDialog(Widget dialog) {
  showDialog(
    context: NavigationService.getNavigator().currentState.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

double calculateBottonButtonsBottonDistance(context, totalSizeOfAllWidgets) {
  if (MediaQuery.of(context).size.height < totalSizeOfAllWidgets) {
    return 30;
  } else {
    return MediaQuery.of(context).size.height - totalSizeOfAllWidgets;
  }
}

double calculateLandingPageListHeight(context, totalSizeOfAllWidgets) {
  if ((MediaQuery.of(context).size.height - totalSizeOfAllWidgets) < 300) {
    return 300;
  } else {
    return MediaQuery.of(context).size.height - totalSizeOfAllWidgets;
  }
}

showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Style.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
