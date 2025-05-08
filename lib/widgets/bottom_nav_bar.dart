import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/bottom_bar_controller.dart';
import '../core/constant/app_text.dart';
import '../core/constant/asset_path.dart';
import '../theme/theme_data/app_color.dart';

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
    final appColor = AppColor();
    return Obx(
      () => SizedBox(
        height: 77,
        child: BottomNavigationBar(
          backgroundColor: appColor.white,
          currentIndex: bottomNavController.selectedIndex.value,
          selectedItemColor: appColor.navBarButton,
          unselectedItemColor: appColor.black,
          onTap: bottomNavController.changeIndex,
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
