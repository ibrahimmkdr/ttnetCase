import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/controllers/timer_controller.dart';
import 'package:ttnetcase/core/theme/app_color.dart';

import '../../core/constant/app_text.dart';

class ConnectionBox extends StatelessWidget {
  const ConnectionBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerController = Get.find<TimerController>();
    final appText = AppText();
    final appColor = ColorTheme();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appText.connectText,
              style: TextStyle(fontSize: 12, color: appColor.black),
            ),
            SizedBox(height: 4),
            Obx(
              () => Text(
                timerController.elapsedTime.value,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: appColor.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
