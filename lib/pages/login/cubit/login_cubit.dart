import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> logIn(Map<String, dynamic> data) async {
    emit(LoginLoading(message: 'Авторизация...'));
    try {
      await Future.delayed(Duration(seconds: 3));
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailed());
    }
  }
}
