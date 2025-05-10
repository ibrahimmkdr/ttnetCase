import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/controllers/timer_controller.dart';

import '../views/home/home_view.dart';
import '../views/settings_view.dart';

class BottomNavController extends GetxController {
  final timerController = Get.put(TimerController());
  var selectedIndex = 0.obs;

  final pages = [
    HomeView(),
    Placeholder(),
    SettingsView(),
  ];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }

  bool shouldShowDisconnectDialog() {
    return timerController.selectedCountry.value.id != null;
  }

  void stopTimer() {
    timerController.stopTimer();
  }
}
