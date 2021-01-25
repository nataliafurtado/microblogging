import 'package:flare_flutter/flare_testing.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:microblogging/main.dart' as app;

void main() {
  enableFlutterDriverExtension();
  FlareTesting.setup();

  app.main();
}
