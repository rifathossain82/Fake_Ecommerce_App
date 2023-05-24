import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedPreferences;

  LocalStorage(this.sharedPreferences);

  Future<bool> saveData({
    required LocalStorageKey key,
    required dynamic data,
  }) {
    if (data is String) {
      return sharedPreferences.setString(key.toString(), data);
    } else if (data is int) {
      return sharedPreferences.setInt(key.toString(), data);
    } else if (data is double) {
      return sharedPreferences.setDouble(key.toString(), data);
    } else if (data is bool) {
      return sharedPreferences.setBool(key.toString(), data);
    } else if (data is List<String>) {
      return sharedPreferences.setStringList(key.toString(), data);
    } else {
      throw Exception('Unsupported data type');
    }
  }

  dynamic getData({required LocalStorageKey key}) {
    return sharedPreferences.get(key.toString());
  }

  Future<bool> removeData({required LocalStorageKey key}) {
    return sharedPreferences.remove(key.toString());
  }
}