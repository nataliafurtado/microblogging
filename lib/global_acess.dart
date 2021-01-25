import 'package:flutter/material.dart';

import 'models/user.dart';

class GlobalAccess {
  User user;

  logout(context) {
    user = null;
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/',
      (Route<dynamic> route) => false,
    );
  }
}
