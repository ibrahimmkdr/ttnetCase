import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';
import '../core/theme/app_color.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/home/draver_menu.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({super.key});

  final bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    final appColor = ColorTheme();
    return Obx(
      () => Scaffold(
          drawer: DrawerMenu(),
          backgroundColor: appColor.scaffoldColor,
          bottomNavigationBar:
              BottomNavBar(bottomNavController: bottomNavController),
          body: bottomNavController
              .pages[bottomNavController.selectedIndex.value]),
    );
  }
}
