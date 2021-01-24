import 'package:flutter/material.dart';
import 'package:microblogging/modules/login/login_controller.dart';
import 'package:microblogging/modules/login/login_page_new_user.dart';
import 'package:microblogging/modules/login/widgets/login_new_user.dart';
import 'package:provider/provider.dart';

import 'modules/landing_page/landing_page.dart';
import 'modules/landing_page/landing_page_provider.dart';
import 'modules/list_of_posts/list_of_posts_controller.dart';
import 'modules/list_of_posts/list_of_posts_page_edit_create.dart';
import 'modules/home/home_provider.dart';
import 'modules/login/login_provider.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPageProvider());

      case '/home-page':
        return MaterialPageRoute(builder: (_) => HomeProvider());

      case '/login-page':
        return MaterialPageRoute(builder: (_) => LoginProvider());

      case '/login-new-user':
        if (args is LoginController) {
          return MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider<LoginController>.value(
                value: args,
                child: LoginNewUserPage(),
              );
            },
          );
        }
        break;

      case '/edit-create-post':
        if (args is ListOfPostsController) {
          return MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider<ListOfPostsController>.value(
                value: args,
                child: EditCreatePostPage(),
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
