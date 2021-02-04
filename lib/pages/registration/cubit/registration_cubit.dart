import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  Future<void> register(Map<String, dynamic> data) async {
    print(data);
    emit(RegistrationLoading());
    try {
      await Future.delayed(Duration(seconds: 3));
      emit(RegistrationSuccess());
    } catch (e) {
      emit(RegistrationFailed());
    }
  }
}
