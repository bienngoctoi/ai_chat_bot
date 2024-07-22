import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Pref {
  static late Box _box;
  static Future<void> initialize() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("myData");
  }

  static bool get showOnBoarding =>
      _box.get("showOnBoarding", defaultValue: true);
  static set showOnBoarding(bool value) => _box.put("showOnBoarding", value);

  static bool get isDarkMode => _box.get("isDarkMode") ?? false;
  static set isDarkMode(bool value) => _box.put("isDarkMode", value);

  static ThemeMode get defaultTheme {
    final data = _box.get("isDarkMode");
    log("data: $data");
    if (data == null) return ThemeMode.system;
    if (data == true) return ThemeMode.dark;
    return ThemeMode.light;
  }
}
