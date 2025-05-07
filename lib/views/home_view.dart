import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_bar_controller.dart';
import '../theme/app_color.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    final appColor = AppColor();
    return Scaffold(
      backgroundColor: appColor.scaffoldColor,
      bottomNavigationBar:
          BottomNavBar(bottomNavController: bottomNavController),
      body: Obx(() =>
          bottomNavController.pages[bottomNavController.selectedIndex.value]),
    );
  }
}
