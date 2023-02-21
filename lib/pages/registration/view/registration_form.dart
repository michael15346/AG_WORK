import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../registration.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController? _emailController,
      _passwordController,
      _passwordRepeatController,
      _firstNameController,
      _secondNameController;
  RegistrationCubit? _registrationCubit;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();
    _firstNameController = TextEditingController();
    _secondNameController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _registrationCubit = BlocProvider.of<RegistrationCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) async {
      if (state is RegistrationLoading)
        _showSnackBar('Регистрация...', showProgress: true);
      if (state is RegistrationSuccess) {
        _showSnackBar('Регистрация пройдена успешно');
        await Future.delayed(Duration(seconds: 3));
        Navigator.popUntil(context, ModalRoute.withName('/'));
      }
      if (state is RegistrationFailed) {
        _showSnackBar('Ошибка регистрация');
      }
    }, builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(children: [
          TextFormField(
            //ругается на перекрытие элементов с клавиатурой
            controller: _firstNameController,
            decoration:
                InputDecoration(labelText: "Фамилия", hintText: "Иванов"),
          ),
          TextFormField(
            controller: _secondNameController,
            decoration: InputDecoration(labelText: "Имя", hintText: "Иван"),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                labelText: "E-mail", hintText: "example@mail.com"),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Пароль"),
          ),
          TextFormField(
            controller: _passwordRepeatController,
            obscureText: true,
            decoration: InputDecoration(labelText: "Повторите пароль"),
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () => _registrationCubit?.register({
              'firstName': _firstNameController?.text ?? '',
              'secondName': _secondNameController?.text ?? '',
              'email': _emailController?.text ?? '',
              'password': _passwordController?.text ?? '',
              'passwordRepeat': _passwordRepeatController?.text ?? '',
            }),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Подтвердить",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
        ]),
      );
    });
  }

  _showSnackBar(String text, {bool showProgress = false}) {
    final snackBar = SnackBar(
      content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            if (showProgress) CircularProgressIndicator()
          ]),
      backgroundColor: Colors.grey,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
