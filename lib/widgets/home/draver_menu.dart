import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/controllers/vip_controller.dart';
import 'package:ttnetcase/core/constant/app_text.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vipController = Get.find<VipController>();
    final appText = AppText();
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Text(vipController.isVip.value
                ? appText.vipUser
                : appText.unVipUser),
          ),
        ],
      ),
    );
  }
}
