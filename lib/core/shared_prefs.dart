import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';

class SharedPrefs {
  SharedPrefs._();

  static final SharedPrefs _instance = SharedPrefs._();

  factory SharedPrefs() => _instance;

  final String themeKey = 'theme';

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
}
