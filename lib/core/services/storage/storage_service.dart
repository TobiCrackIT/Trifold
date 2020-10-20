import 'package:flutter/material.dart';

abstract class StorageService{
  ThemeMode themeMode;
  Future<bool> clear();
}