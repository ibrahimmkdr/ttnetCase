import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/app_binding.dart';
import 'package:ttnetcase/views/bottom_bar_view.dart';

import 'controllers/country_card_controller.dart';
import 'controllers/timer_controller.dart';
import 'controllers/vip_controller.dart';
import 'core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeController = Get.put(ThemeController());
  await themeController.loadTheme();

  Get.put(TimerController());
  Get.put(VipController());
  Get.put(CountryCardController());

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
