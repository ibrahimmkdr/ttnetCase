import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/core/constant/app_text.dart';
import 'package:ttnetcase/theme/theme_data/app_color.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppText();
    final appColor = AppColor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor.appbarColor,
        title: Text(
          appText.settingTitle,
          style: TextStyle(color: appColor.white, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Switch theme"),
            ElevatedButton(
                onPressed: () {
                  Get.isDarkMode
                      ? Get.changeTheme(ThemeData.light())
                      : Get.changeTheme(ThemeData.dark());
                },
                child: Text("change theme")),
          ],
        ),
      ),
    );
  }
}
