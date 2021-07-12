import 'package:quiz_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static const IS_LOGGED_IN = "is_logged_in";
  static const USER_NAME = "user_name";
  static const USER_EMAIL = "user_email";
  static const USER_PASSWORD = "user_password";

  static Future<bool> saveUserData(
      String name, String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Constants.USER_NAME, name);
    preferences.setString(Constants.USER_EMAIL, email);
    preferences.setString(Constants.USER_PASSWORD, password);
    return preferences.setBool(Constants.IS_LOGGED_IN, true);
  }

  static Future<User> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name = sharedPreferences.getString(Constants.USER_NAME);
    String email = sharedPreferences.getString(Constants.USER_EMAIL);
    String password = sharedPreferences.getString(Constants.USER_PASSWORD);
    if (email == null) {
      name = "name";
    }
    if (password == null) {
      name = "password";
    }
    User user = User(name, email, password);
    return user;
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(Constants.IS_LOGGED_IN) &&
        sharedPreferences.getBool(Constants.IS_LOGGED_IN);
  }

  static clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
