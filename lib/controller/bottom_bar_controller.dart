import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/views/home/pages/home_body.dart';

import '../views/settings_view.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [
    HomeBody(),
    Placeholder(),
    SettingsView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
