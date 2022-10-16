import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static const String APP_LOGIN_STATUS = "LoginStatus";
  static const String APP_TOKEN = "Token";

  static SharedPreferences? prefsInstance;

  static Future<SharedPreferences> get _instance async => prefsInstance = await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    prefsInstance ??= await _instance;
    return prefsInstance;
  }

  static String getLoginStatus() {
    return prefsInstance?.getString(APP_LOGIN_STATUS) ?? "";
  }

  static Future<bool> setLoginStatus(String value) async {
    var prefs = await _instance;
    return prefs.setString(APP_LOGIN_STATUS, value);
  }

  static String getToken() {
    return prefsInstance?.getString(APP_TOKEN) ?? "";
  }

  static Future<bool> setToken(String value) async {
    var prefs = prefsInstance;
    return prefs?.setString(APP_TOKEN, value) ?? Future.value(false);
  }
}
