import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // for saving the value
  static Future<void> saveInt(String key, int value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt(key, value);
  }

  // for getting the value
  static Future<int> getInt(String key, int defaultValue) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key) ?? defaultValue;
  }
}
