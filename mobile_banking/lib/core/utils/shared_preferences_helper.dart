import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Keys for each preference
  static const String userId = 'userId';
  static const String loginCode = 'loginCode';

  // Singleton instance
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() => _instance;

  SharedPreferencesHelper._internal();

  // Save string preference
  Future<void> setUserId(String? userId_) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userId, userId_ ?? "");
  }

  // Get string preference
  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId) ?? "";
  }

  // Save string preference
  Future<void> setLoginCode(String? loginCode_) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginCode, loginCode_ ?? "");
  }

  // Get string preference
  Future<String> getLoginCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(loginCode) ?? "";
  }

  // Clear all preferences
  Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
