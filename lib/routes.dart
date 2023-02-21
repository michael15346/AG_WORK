import "package:flutter/material.dart";
import "pages/login/view/login_page.dart";
import 'pages/home/home.dart';
import 'pages/registration/view/registration_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => HomePage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case RegistrationPage.routeName:
        return MaterialPageRoute(builder: (context) => RegistrationPage());
      default:
        debugPrint("No route");
        return null;
    }
  }
}
