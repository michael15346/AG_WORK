import '../../models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  User? _user;
  User? get user => _user;
  Future<User> logIn(Map<String, dynamic> data) async {
    return User();
  }

  Future<void> signUp(Map<String, dynamic> data) async {}
  Future<void> deleteInfo() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<void> persistInfo(User user) async {
    _user = user;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', '');
  }

  Future<bool> hasInfo() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      final token = prefs.getString('token');
      _user = User();
    }
    return _user == null ? false : true;
  }
}
