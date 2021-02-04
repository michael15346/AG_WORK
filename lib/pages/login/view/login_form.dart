import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login.dart';
import '../../registration/view/registration_page.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController, _passwordController;
  LoginCubit _loginCubit;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _loginCubit = BlocProvider.of<LoginCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        cubit: _loginCubit,
        listener: (context, state) async {
          if (state is LoginLoading)
            _showSnackBar('Авторизация...', showProgress: true);
          if (state is LoginSuccess) {
            _showSnackBar('Авторизация пройдена успешно');
            await Future.delayed(Duration(seconds: 3));
            Navigator.pop(
                context); //При попытке нажать на кнопку регистрации, когда уже происходит регистрация,
          } //вместо главной страницы перебрасывает на страницу авторизации
          //Возможно, стоит блокировать кнопку на это время

          //рефакторинг VSCode сходит с ума, если пытаться писать комментарии
          if (state is LoginFailed) {
            _showSnackBar('Ошибка авторизации');
          }
        },
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(children: [
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
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () => _loginCubit.logIn({
                  'email': _emailController?.text ?? '',
                  'password': _passwordController?.text ?? '',
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
              RaisedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RegistrationPage.routeName),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Регистрация",
                  style: TextStyle(color: Colors.white),
                ),
              ),
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
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
