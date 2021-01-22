import 'package:flutter/material.dart';

import 'pages/home/home.dart';
import 'pages/login/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => HomePage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        debugPrint('Something wrong with route');
    }
  }
}
