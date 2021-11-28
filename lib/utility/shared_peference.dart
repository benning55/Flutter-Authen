import 'package:coolapp/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("mongoId", user.id);
    prefs.setString("refreshToken", user.refresh_token);
    prefs.setString("token", user.token);
    prefs.setString("email", user.email);
    prefs.setString("password", user.password);
    prefs.setString("userId", user.user_id);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String mongoId = prefs.getString("mongoId");
    String refreshToken = prefs.getString("refreshToken");
    String token = prefs.getString("token");
    String email = prefs.getString("email");
    String password = prefs.getString("password");
    String userId = prefs.getString("userId");

    return User(
        id: mongoId,
        password: password,
        email: email,
        token: token,
        refresh_token: refreshToken,
        user_id: userId);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("mongoId");
    prefs.remove("refreshToken");
    prefs.remove("token");
    prefs.remove("email");
    prefs.remove("password");
    prefs.remove("userId");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("token");
  }
}
