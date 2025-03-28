import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static final AppSharedPreference _instance = AppSharedPreference._internal();

  SharedPreferences? _prefs;

  factory AppSharedPreference() => _instance;

  AppSharedPreference._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveBool(String settingKey, bool value) async {
    _prefs?.setBool(settingKey, value);
  }

  Future<void> saveString(String settingKey, String value) async {
    _prefs?.setString(settingKey, value);
  }

  Future<void> saveDouble(String settingKey, double value) async {
    _prefs?.setDouble(settingKey, value);
  }

  bool? getBool(String settingKey) {
    return _prefs?.getBool(settingKey);
  }

  double? getDouble(String settingKey) {
    return _prefs?.getDouble(settingKey);
  }

  String? getString(String settingKey) {
    return _prefs?.getString(settingKey);
  }
}
