import 'package:flutter/material.dart';

import "routes.dart";
import 'pages/home/home.dart';
import 'theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App',
      theme: appTheme,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePage(),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
*/
