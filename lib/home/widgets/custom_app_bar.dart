import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constant/app_text.dart';
import '../../core/constant/asset_path.dart';
import '../../theme/app_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = AppColor();
    final assetPath = AssetPath();
    final appText = AppText();
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: 150,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      backgroundColor: appColor.appbarColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isExpanded = constraints.maxHeight > kToolbarHeight + 50;
          return FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.asset(assetPath.appBarAsset1),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(assetPath.appBarAsset2),
                ),
                if (isExpanded)
                  Positioned(
                    left: 30,
                    right: 30,
                    bottom: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: appColor.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: appText.searchHint,
                          hintStyle: TextStyle(
                            color: appColor.lightGrey,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          suffixIcon: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.only(right: 12),
                            child: SvgPicture.asset(
                              assetPath.appBarSearch,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      title: Text(
        appText.title,
        style: TextStyle(
          color: appColor.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      leading: Transform.translate(
        offset: Offset(20, 0),
        child: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            assetPath.appBarMenu,
          ),
        ),
      ),
      actions: [
        Transform.translate(
          offset: Offset(-20, 0),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              assetPath.appBarVip,
            ),
          ),
        ),
      ],
    );
  }
}
