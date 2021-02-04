import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/user_repository.dart';
import '../../models/user/user.dart';
part 'authentification_state.dart';

class AuthentificationCubit extends Cubit<AuthentificationStatus> {
  final UserRepository userRepository;
  AuthentificationCubit({this.userRepository})
      : super(AuthentificationStatus.unknown);
  Future<void> appStarted() async {
    try {
      final hasInfo = await userRepository.hasInfo();
      if (hasInfo) {
        emit(AuthentificationStatus.authentificated);
      } else {
        emit(AuthentificationStatus.unauthentificated);
      }
    } catch (e) {
      await userRepository.deleteInfo();
      emit(AuthentificationStatus.unauthentificated);
    }
  }

  Future<void> loggedIn(User user) async {
    try {
      await userRepository.persistInfo(user);
      emit(AuthentificationStatus.authentificated);
    } catch (e) {}
  }

  Future<void> loggedOut() async {
    try {
      await userRepository.deleteInfo();
      emit(AuthentificationStatus.unauthentificated);
    } catch (e) {}
  }
}
