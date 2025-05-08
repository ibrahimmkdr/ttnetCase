import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme_controller.dart';

class ColorTheme {
  final themeController = Get.put(ThemeController());

  Color get appbarColor =>
      themeController.isDarkMode ? Color(0xFF1A1A1A) : Color(0xFF1A5CFF);

  Color get appbarIconColor =>
      themeController.isDarkMode ? Colors.grey.shade800 : Color(0xFF3B74FF);

  Color get scaffoldColor =>
      themeController.isDarkMode ? Color(0xFF121212) : Color(0xfff0f5f5);

  Color get cardColor =>
      themeController.isDarkMode ? Color(0xFF1E1E1E) : Colors.white;

  Color get downloadColor =>
      themeController.isDarkMode ? Colors.grey.shade800 : Color(0xffd5f4e9);

  Color get uploadColor =>
      themeController.isDarkMode ? Colors.grey.shade800 : Color(0xfff7dddf);

  Color get activeButBackCollor =>
      themeController.isDarkMode ? Color(0xFF2D7AFF) : Color(0xFF1A5CFF);

  Color get passiveButBackCollor =>
      themeController.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200;

  Color get white =>
      themeController.isDarkMode ? Color(0xFF1E1E1E) : Colors.white;

  Color get black => themeController.isDarkMode ? Colors.white : Colors.black;

  Color get blue =>
      themeController.isDarkMode ? Color(0xFF2D7AFF) : Colors.blue;

  Color get passiveNavIconCollor =>
      themeController.isDarkMode ? Colors.white : Colors.black;

  Color get navBarButton =>
      themeController.isDarkMode ? Color(0xFF2D7AFF) : Color(0xFF185BFF);

  Color get gray =>
      themeController.isDarkMode ? Colors.grey.shade600 : Colors.grey;

  Color get darkGrey =>
      themeController.isDarkMode ? Color(0xFFCCCCCC) : Color(0xff333333);

  Color get lightGrey =>
      themeController.isDarkMode ? Color(0xFF999999) : Color(0xff666666);

  Color get titleColor =>
      themeController.isDarkMode ? Colors.white : Colors.white;

  Color get subTitleColor => themeController.isDarkMode
      ? Colors.white.withOpacity(0.6)
      : Colors.black.withOpacity(0.4);
}
