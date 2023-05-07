import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<bool> saveData({
    required LocalStorageKey key,
    required dynamic data,
  }) async {
    final SharedPreferences prefs = await _prefs;
    if (data is String) {
      return prefs.setString(key.toString(), data);
    } else if (data is int) {
      return prefs.setInt(key.toString(), data);
    } else if (data is double) {
      return prefs.setDouble(key.toString(), data);
    } else if (data is bool) {
      return prefs.setBool(key.toString(), data);
    } else if (data is List<String>) {
      return prefs.setStringList(key.toString(), data);
    } else {
      throw Exception('Unsupported data type');
    }
  }

  static dynamic getData({required LocalStorageKey key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key.toString());
  }

  static Future<bool> removeData({required LocalStorageKey key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key.toString());
  }
}
