import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trifold/core/services/storage/storage_service.dart';

class StorageServiceImpl implements StorageService{

  static StorageServiceImpl _instance;
  static SharedPreferences _preferences;

  static const String theme_mode='theme_mode';

  static Future<StorageServiceImpl> getInstance()async{

    _instance??=StorageServiceImpl();
    _preferences??= await SharedPreferences.getInstance();

    return _instance;

  }

  @override
  ThemeMode get themeMode {
    var themeString = _getFromDisk(theme_mode);
    if (themeString == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }

    if (themeString == ThemeMode.light.toString()) {
      return ThemeMode.light;
    }

    return ThemeMode.system;
  }

  @override
  set themeMode(ThemeMode value) {
    if (value == null) {
      _saveToDisk(theme_mode, ThemeMode.system.toString());
    } else {
      var theme = value.toString();
      _saveToDisk(theme_mode, theme);
    }
  }

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  @override
  Future<bool> clear() {
    return _preferences.clear();
  }

}