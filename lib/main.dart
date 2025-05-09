import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/app_binding.dart';
import 'package:ttnetcase/views/bottom_bar_view.dart';

import 'core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeController = Get.put(ThemeController());
  await themeController.loadTheme();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      home: BottomBarView(),
    );
  }
}
