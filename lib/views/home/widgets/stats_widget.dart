import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ttnetcase/core/constant/asset_path.dart';

import '../../../core/constant/app_text.dart';
import '../../../theme/app_color.dart';

class StatsWidget extends StatelessWidget {
  StatsWidget({super.key});
  final appColor = AppColor();
  final appText = AppText();

  @override
  Widget build(BuildContext context) {
    final assetPath = AssetPath();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCountryCard(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDataCard(
                  iconPath: assetPath.download,
                  label: appText.download,
                  backgroundColor: appColor.white,
                ),
                const SizedBox(width: 8),
                _buildDataCard(
                  iconPath: assetPath.upload,
                  label: appText.upload,
                  backgroundColor: appColor.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // country Card widget
  Widget _buildCountryCard() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 56,
      width: 248,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: appColor.cardColor,
      ),
      child: Row(
        children: [
          CountryFlag.fromCountryCode(
            shape: RoundedRectangle(8),
            "tr",
            width: 36,
            height: 28,
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Turkey",
                style: TextStyle(
                  fontSize: 14,
                  color: appColor.black,
                ),
              ),
              Text(
                "Bursa",
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
                "%14",
                style: TextStyle(
                  fontSize: 11,
                  color: appColor.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// download upload widget
Widget _buildDataCard({
  required String iconPath,
  required String label,
  required Color backgroundColor,
}) {
  return Container(
    height: 56,
    width: 120,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath),
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
            Text(
              "15Mb",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
