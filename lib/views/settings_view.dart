import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/core/constant/app_text.dart';
import 'package:ttnetcase/core/theme/app_color.dart';

import '../core/theme/theme_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    final appText = AppText();
    final appColor = ColorTheme();
    return Obx(
      () => Scaffold(
        backgroundColor: appColor.scaffoldColor,
        appBar: AppBar(
          backgroundColor: appColor.appbarColor,
          title: Text(
            appText.settingTitle,
            style: TextStyle(color: appColor.titleColor, fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  themeController.toggleTheme();
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: appColor.white),
                child: Text(
                  themeController.isDarkMode ? "Change Light" : "Change Dark",
                  style: TextStyle(color: appColor.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
