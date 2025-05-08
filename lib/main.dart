import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/app_binding.dart';
import 'package:ttnetcase/views/bottom_bar_view.dart';

import 'core/theme/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialBinding: InitialBinding(),
      home: BottomBarView(),
    );
  }
}
