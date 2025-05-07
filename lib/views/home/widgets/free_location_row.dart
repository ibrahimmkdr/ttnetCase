import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/app_text.dart';
import '../../../core/constant/asset_path.dart';
import '../../../theme/app_color.dart';

class FreeLocationRow extends StatelessWidget {
  const FreeLocationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = AppColor();
    final appText = AppText();
    final assetPath = AssetPath();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 32, right: 32),
        child: Row(
          children: [
            Text(
              appText.freeLocation,
              style: TextStyle(
                fontSize: 12,
                color: appColor.gray,
              ),
            ),
            Spacer(),
            SvgPicture.asset(assetPath.exclamation)
          ],
        ),
      ),
    );
  }
}
