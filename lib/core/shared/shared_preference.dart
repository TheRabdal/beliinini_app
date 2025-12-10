import 'package:beliinini_app/packages/packages.dart';

class SharedPreference {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setAuthToken(String token) async {
    await _preferences.setString('auth_token', token);
  }

  static String? getAuthToken() {
    return _preferences.getString('auth_token');
  }

  static Future<void> clearAuthToken() async {
    await _preferences.remove('auth_token');
  }
}
