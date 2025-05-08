import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/core/theme/app_color.dart';
import 'package:ttnetcase/views/home/home_view.dart';

import '../core/constant/app_text.dart';
import '../views/settings_view.dart';
import 'timer_controller.dart';

class BottomNavController extends GetxController {
  final timerController = Get.put(TimerController());
  var selectedIndex = 0.obs;
  final appText = AppText();
  final appColor = ColorTheme();

  final pages = [
    HomeView(),
    Placeholder(),
    SettingsView(),
  ];

  void changeIndex(int index) {
    if (index == 1) {
      if (timerController.selectedCountry.value.id != null) {
        Get.defaultDialog(
          backgroundColor: appColor.white,
          title: appText.disconnectTitle,
          titleStyle: TextStyle(fontSize: 24, color: appColor.black),
          middleText: appText.disconnectDesc,
          middleTextStyle: TextStyle(fontSize: 16, color: appColor.black),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appColor.gray,
              ),
              child: Text(
                appText.no,
                style: TextStyle(color: appColor.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                timerController.stopTimer();
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appColor.gray,
              ),
              child: Text(appText.yes, style: TextStyle(color: appColor.black)),
            ),
          ],
        );
      }
    } else {
      selectedIndex.value = index;
    }
  }
}
