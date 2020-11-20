import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'pages/login/view/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    final args = setting.arguments;
    switch (setting.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        debugPrint('Error in routing');
    }
  }
}
