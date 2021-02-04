import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registration.dart';

class RegistrationPage extends StatelessWidget {
  static const routeName = '/registration';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Регистрация")),
      body: BlocProvider(
        create: (context) => RegistrationCubit(),
        child: RegistrationForm(),
      ),
    );
  }
}
