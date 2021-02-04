import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Авторизация")),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginForm(),
      ),
    );
  }
}
