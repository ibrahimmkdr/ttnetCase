import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/controller/timer_controller.dart';
import 'package:ttnetcase/core/constant/asset_path.dart';

import '../../../models/country_model.dart';
import '../../../theme/theme_data/app_color.dart';

class CountryListCard extends StatelessWidget {
  final CountryModel countryInfo;
  CountryListCard({
    super.key,
    required this.countryInfo,
  });
  final appColor = AppColor();
  final appAsset = AssetPath();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TimerController>();

    return Padding(
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
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14),
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
              Spacer(),
              Row(
                children: [
                  Obx(() {
                    final isSelected =
                        controller.selectedCountry.value.id == countryInfo.id;
                    return _iconButton(
                      onTap: () {
                        controller.toggleSelection(countryInfo);
                      },
                      iconPath: appAsset.timerButton,
                      isSelected: isSelected,
                    );
                  }),
                  const SizedBox(width: 8),
                  _iconButton(
                    onTap: () {},
                    iconPath: appAsset.cardArrowButton,
                    backgroundColor: appColor.passiveButBackCollor,
                    iconColor: appColor.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton({
    required VoidCallback onTap,
    required String iconPath,
    bool isSelected = false,
    Color? backgroundColor,
    Color? iconColor,
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
          child: SvgPicture.asset(
            iconPath,
            color: svgColor,
            width: 16,
            height: 16,
          ),
        ),
      ),
    );
  }
}
