import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/theme/theme_data/app_color.dart';
import 'package:ttnetcase/views/home/pages/home_body.dart';

import '../core/constant/app_text.dart';
import '../views/settings_view.dart';
import 'timer_controller.dart';

class BottomNavController extends GetxController {
  final timerController = Get.put(TimerController());
  var selectedIndex = 0.obs;
  final appText = AppText();
  final appColor = AppColor();

  final pages = [
    HomeBody(),
    Placeholder(),
    SettingsView(),
  ];

  void changeIndex(int index) {
    if (index == 1) {
      if (timerController.selectedCountry.value.id != null) {
        Get.defaultDialog(
            title: appText.disconnectTitle,
            titleStyle: TextStyle(fontSize: 24, color: appColor.black),
            middleText: appText.disconnectDesc,
            middleTextStyle: TextStyle(fontSize: 16, color: appColor.black),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  appText.no,
                  style: TextStyle(color: Colors.green),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  timerController.stopTimer();
                  Get.back();
                },
                child: Text(appText.yes, style: TextStyle(color: Colors.red)),
              ),
            ]);
      } else {
        Get.snackbar("Error", "No Connection",
            backgroundColor: appColor.cardColor);
      }
    } else {
      selectedIndex.value = index;
    }
  }
}
