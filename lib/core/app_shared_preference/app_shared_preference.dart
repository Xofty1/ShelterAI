import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static final AppSharedPreference _instance = AppSharedPreference._internal();

  SharedPreferences? _prefs;

  factory AppSharedPreference() => _instance;

  AppSharedPreference._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveMusic(int value) async {
    await _prefs?.setInt("music", value);
  }

  Future<void> saveDubbing(int value) async {
    await _prefs?.setInt("dubbing", value);
  }

  Future<void> saveEffects(int value) async {
    await _prefs?.setInt("effects", value);
  }

  Future<void> saveLanguage(String value) async {
    await _prefs?.setString("language", value);
  }

  int? getMusic() {
    return _prefs?.getInt("music");
  }

  int? getDubbing() {
    return _prefs?.getInt("dubbing");
  }

  int? getEffects() {
    return _prefs?.getInt("effects");
  }

  String? getLanguage() {
    return _prefs?.getString("language");
  }
}
