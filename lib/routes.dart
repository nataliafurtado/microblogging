import 'package:flutter/material.dart';
import 'package:microblogging/modules/login/login_provider.dart';
import 'package:provider/provider.dart';

import 'modules/landing_page/landing_page.dart';
import 'modules/landing_page/landing_page_provider.dart';
import 'modules/list/list_controller.dart';
import 'modules/list/list_page_action_event.dart';
import 'modules/list/list_provider.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPageProvider());

      case '/list-page':
        return MaterialPageRoute(builder: (_) => ListProvider());

      case '/login-page':
        return MaterialPageRoute(builder: (_) => LoginProvider());

      case '/action-event-page':
        if (args is ListController) {
          return MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider<ListController>.value(
                value: args,
                child: ActionEventPage(),
              );
            },
          );
        }
        break;

      default:
        return MaterialPageRoute(builder: (_) => LandingPage());
    }
    return MaterialPageRoute(builder: (_) => LandingPage());
  }
}
