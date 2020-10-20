
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:trifold/app/locator.dart';
import 'package:trifold/core/services/storage/storage_service.dart';

class ThemeService extends ChangeNotifier{
  final _storageService=locator<StorageService>();
  ThemeMode themeMode;

  final StreamController<ThemeMode> themeController = StreamController<ThemeMode>();
  Stream<ThemeMode> get themeModeData => themeController.stream;

  ThemeService() {
    themeController.add(_storageService.themeMode);
    _applyStatusBarColor(_storageService.themeMode);
    notifyListeners();
  }

  void _applyStatusBarColor(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.light);
    } else if (mode == ThemeMode.light) {
      FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    } else {
      FlutterStatusbarTextColor.setTextColor('default');
    }
  }

  changeThemeMode(newThemeMode) {
    themeMode = newThemeMode;
    _storageService.themeMode = themeMode;
    _applyStatusBarColor(themeMode);
    themeController.add(themeMode);
    notifyListeners();
  }
}