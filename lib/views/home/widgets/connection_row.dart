import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/controller/timer_controller.dart';

import '../../../core/constant/app_text.dart';

class ConnectionRow extends StatelessWidget {
  const ConnectionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerController = Get.find<TimerController>();
    final appText = AppText();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appText.connectText,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 4),
            Obx(
              () => Text(
                timerController.elapsedTime.value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
