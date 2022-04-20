import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final themeStorage = GetStorage();
  final themeType = 'isDarkMode';

  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool loadThemeFromBox() => themeStorage.read(themeType) ?? false;

  saveThemeToBox(bool isDarkMode) => themeStorage.write(themeType, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeToBox(!loadThemeFromBox());
  }
}
