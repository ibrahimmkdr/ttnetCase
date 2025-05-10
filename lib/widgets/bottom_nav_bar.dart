import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';
import '../core/constant/app_text.dart';
import '../core/constant/asset_path.dart';
import '../core/theme/app_color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.bottomNavController,
  });

  final BottomNavController bottomNavController;

  @override
  Widget build(BuildContext context) {
    final appAsset = AssetPath();
    final appText = AppText();
    final appColor = ColorTheme();

    return Obx(
      () => SizedBox(
        child: BottomNavigationBar(
          backgroundColor: appColor.white,
          currentIndex: bottomNavController.selectedIndex.value,
          selectedItemColor: appColor.navBarButton,
          unselectedItemColor: appColor.black,
          onTap: (index) {
            if (index == 1) {
              if (bottomNavController.shouldShowDisconnectDialog()) {
                Get.defaultDialog(
                  backgroundColor: appColor.white,
                  title: appText.disconnectTitle,
                  titleStyle: TextStyle(
                    fontSize: 24,
                    color: appColor.black,
                  ),
                  middleText: appText.disconnectDesc,
                  middleTextStyle: TextStyle(
                    fontSize: 16,
                    color: appColor.black,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Get.back(),
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
                        bottomNavController.stopTimer();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColor.gray,
                      ),
                      child: Text(
                        appText.yes,
                        style: TextStyle(color: appColor.black),
                      ),
                    ),
                  ],
                );
              } else {
                Get.defaultDialog(
                  title: "Error!",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  middleText: "No Connection!",
                  middleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  confirm: TextButton(
                    onPressed: Get.back,
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }
            } else {
              bottomNavController.updateIndex(index);
            }
          },
          iconSize: 25,
          selectedFontSize: 12,
          unselectedFontSize: 11,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                appAsset.mapIcon,
                color: bottomNavController.selectedIndex.value == 0
                    ? appColor.navBarButton
                    : appColor.black,
              ),
              label: appText.bottom1Text,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                appAsset.radarIcon,
                color: bottomNavController.selectedIndex.value == 1
                    ? appColor.navBarButton
                    : appColor.black,
              ),
              label: appText.bottom2Text,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                appAsset.settingsIcon,
                color: bottomNavController.selectedIndex.value == 2
                    ? appColor.navBarButton
                    : appColor.black,
              ),
              label: appText.bottom3Text,
            ),
          ],
        ),
      ),
    );
  }
}
