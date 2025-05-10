import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/controllers/country_card_controller.dart';
import 'package:ttnetcase/controllers/timer_controller.dart';
import 'package:ttnetcase/core/utils/svg_container.dart';

import '../../controllers/vip_controller.dart';
import '../../core/constant/app_text.dart';
import '../../core/constant/asset_path.dart';
import '../../core/theme/app_color.dart';
import '../../models/country_model.dart';

class CountryListCard extends StatelessWidget {
  final CountryModel countryInfo;
  CountryListCard({
    super.key,
    required this.countryInfo,
  });
  final appColor = ColorTheme();
  final appAsset = AssetPath();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TimerController>();
    final vipController = Get.find<VipController>();
    final cardController = Get.find<CountryCardController>();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 32, left: 32, top: 8),
          child: Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              color: appColor.cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  CountryFlag.fromCountryCode(
                    shape: RoundedRectangle(8),
                    countryInfo.flagCode ?? "",
                    width: 37,
                    height: 28,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        countryInfo.countryName ?? "",
                        style: TextStyle(
                            color: appColor.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        "${countryInfo.countryCity?.length ?? 0} Locations",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: appColor.subTitleColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12),
                  if (countryInfo.isPremium ?? false)
                    SvgContainer(
                      assetName: appAsset.appBarVip,
                      height: 28,
                      width: 28,
                      color: appColor.appbarIconColor,
                      padding: EdgeInsets.all(4),
                      radius: BorderRadius.circular(8),
                    ),
                  Spacer(),
                  Row(
                    children: [
                      Obx(() {
                        final isSelected =
                            controller.selectedCountry.value.id ==
                                countryInfo.id;
                        return _iconButton(
                          onTap: () {
                            if (countryInfo.isPremium == true &&
                                !vipController.isVip.value) {
                              _showVipDialog(context);
                              return;
                            }
                            controller.toggleSelection(countryInfo);
                          },
                          iconPath: appAsset.timerButton,
                          isSelected: isSelected,
                        );
                      }),
                      SizedBox(width: 8),
                      Obx(() {
                        final isExpanded =
                            cardController.isExpanded(countryInfo.id ?? '');
                        return _iconButton(
                          onTap: () {
                            if (countryInfo.isPremium == true &&
                                !vipController.isVip.value) {
                              _showVipDialog(context);
                              return;
                            }
                            cardController.toggleCard(countryInfo.id ?? '');
                          },
                          iconPath: appAsset.cardArrowButton,
                          backgroundColor: appColor.passiveButBackCollor,
                          iconColor: appColor.black,
                          isRotated: isExpanded,
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(() {
          final isExpanded = cardController.isExpanded(countryInfo.id ?? '');
          if (!isExpanded) return SizedBox.shrink();

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Container(
              decoration: BoxDecoration(
                color: appColor.cardColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 2, bottom: 4),
                itemCount: countryInfo.countryCity?.length ?? 0,
                itemBuilder: (context, index) {
                  final cityName = countryInfo.countryCity?[index] ?? "";
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: appColor.blue, size: 18),
                        SizedBox(width: 8),
                        Text(
                          cityName,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: appColor.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _iconButton({
    required VoidCallback onTap,
    required String iconPath,
    bool isSelected = false,
    Color? backgroundColor,
    Color? iconColor,
    bool isRotated = false,
  }) {
    final bgColor = backgroundColor ??
        (isSelected
            ? appColor.activeButBackCollor
            : appColor.passiveButBackCollor);
    final svgColor =
        iconColor ?? (isSelected ? appColor.white : appColor.black);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Transform.rotate(
            angle: isRotated ? 1.5708 : 0,
            child: SvgPicture.asset(
              iconPath,
              color: svgColor,
              width: 16,
              height: 16,
            ),
          ),
        ),
      ),
    );
  }
}

void _showVipDialog(BuildContext context) {
  final appText = AppText();
  final appColor = ColorTheme();
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.all(16),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
      title: Row(
        children: [
          Text(
            appText.unVipTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Text(
        appText.unVipSubtile,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: appColor.appbarColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          child: Text(
            appText.close,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    ),
  );
}
