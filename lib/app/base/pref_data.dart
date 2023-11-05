import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String prefName = "com.screensizer.screen_sizer";

  static String introAvailable = prefName + "isIntroAvailable";
  static String isLoggedIn = prefName + "isLoggedIn";
  static String getTheme = prefName + "isSelectedTheme";
  static String token = prefName + "token";

  static Future<SharedPreferences> getPrefInstance() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  static setLogIn(bool avail) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setBool(isLoggedIn, avail);
  }

  static Future<bool> isLogIn() async {
    SharedPreferences preferences = await getPrefInstance();
    bool isIntroAvailable = preferences.getBool(isLoggedIn) ?? false;
    return isIntroAvailable;
  }

  static Future<void> setUser(String user) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setString("user", user);
  }

  static Future<String> getUser() async {
    SharedPreferences preferences = await getPrefInstance();
    String user = preferences.getString("user") ?? "";
    return user;
  }

  // write functions to set the token and get the token
  static Future<void> setToken(String token) async {
    SharedPreferences preferences = await getPrefInstance();
    preferences.setString("token", token);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await getPrefInstance();
    String token = preferences.getString("token") ?? "";
    return token;
  }
}
