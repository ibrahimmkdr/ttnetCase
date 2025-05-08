import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/controllers/timer_controller.dart';
import 'package:ttnetcase/core/constant/asset_path.dart';
import 'package:ttnetcase/core/utils/svg_container.dart';

import '../../core/constant/app_text.dart';
import '../../core/theme/app_color.dart';

class StatsWidget extends StatelessWidget {
  StatsWidget({super.key});
  final appColor = ColorTheme();
  final appText = AppText();
  final assetPath = AssetPath();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TimerController>();

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCountryCard(controller),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDataCard(
                  iconPath: assetPath.download,
                  label: appText.download,
                  value: controller.download,
                  color: appColor.downloadColor,
                ),
                const SizedBox(width: 8),
                _buildDataCard(
                  iconPath: assetPath.upload,
                  label: appText.upload,
                  value: controller.upload,
                  color: appColor.uploadColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // country Card widget
  Widget _buildCountryCard(TimerController controller) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 56,
      width: 248,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: appColor.cardColor,
      ),
      child: Obx(
        () {
          return Row(
            children: [
              CountryFlag.fromCountryCode(
                shape: RoundedRectangle(8),
                controller.selectedCountry.value.flagCode ?? "",
                width: 36,
                height: 28,
              ),
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.selectedCountry.value.countryName ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      color: appColor.black,
                    ),
                  ),
                  Text(
                    controller.randomCity.value,
                    style: TextStyle(
                      fontSize: 10,
                      color: appColor.lightGrey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Stealth",
                    style: TextStyle(
                      fontSize: 10,
                      color: appColor.lightGrey,
                    ),
                  ),
                  Text(
                    controller.signalStrength.toString(),
                    style: TextStyle(
                      fontSize: 11,
                      color: appColor.black,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  // download upload widget
  Widget _buildDataCard({
    required String iconPath,
    required String label,
    required RxString value,
    required Color? color,
  }) {
    return Container(
      height: 56,
      width: 120,
      decoration: BoxDecoration(
        color: appColor.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgContainer(
              radius: BorderRadius.circular(8),
              assetName: iconPath,
              height: 28,
              width: 28,
              color: color,
              padding: EdgeInsets.all(4)),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
              Obx(
                () => Text(
                  value.value,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: appColor.black,
                      fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
