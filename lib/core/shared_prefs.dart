import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';

class SharedPrefs {
  SharedPrefs._();

  static final SharedPrefs _instance = SharedPrefs._();

  factory SharedPrefs() => _instance;

  final String themeKey = 'theme';
  final String firstTimeKey = 'firstTime';

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    const SharedPreferencesOptions sharedPreferencesOptions =
        SharedPreferencesOptions();

    await migrateLegacySharedPreferencesToSharedPreferencesAsyncIfNecessary(
      legacySharedPreferencesInstance: _prefs,
      sharedPreferencesAsyncOptions: sharedPreferencesOptions,
      migrationCompletedKey: 'migrationCompleted',
    );
  }

  // Theme ===========

  Future<void> setTheme(String theme) async {
    await _prefs.setString(themeKey, theme);
  }

  ThemeMode get theme {
    return switch (_prefs.getString(themeKey) ?? 'light') {
      'dark' => ThemeMode.dark,
      _ => ThemeMode.light,
    };
  }

  void removeTheme() => _prefs.remove(themeKey);

  // First Time ===========

  Future<void> setFirstTime(bool firstTime) async {
    await _prefs.setBool(firstTimeKey, firstTime);
  }

  bool get getFirstTime {
    return _prefs.getBool(firstTimeKey) ?? true;
  }

  void removeFirstTime() => _prefs.remove(firstTimeKey);
}
