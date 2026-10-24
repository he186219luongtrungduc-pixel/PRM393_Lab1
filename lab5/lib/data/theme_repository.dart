import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  static const String _key = 'dark_mode';

  Future<ThemeMode> load() async {
    final isDark = await _prefs.getBool(_key) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> save(ThemeMode mode) async {
    await _prefs.setBool(_key, mode == ThemeMode.dark);
  }
}
