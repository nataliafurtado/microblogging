import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'global_acess.dart';
import 'routes.dart';
import 'services/navigator_sergice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => GlobalAccess(),
        child: MaterialApp(
          navigatorKey: NavigationService.getNavigator(),
          title: "Microblogging",
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.openSansTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
        ));
  }
}
