import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/widgets/home/free_location_row.dart';

import '../../controllers/timer_controller.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/home/connection_box.dart';
import '../../widgets/home/location_list.dart';
import '../../widgets/home/no_connection_row.dart';
import '../../widgets/home/stats_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerController = Get.find<TimerController>();
    return CustomScrollView(
      slivers: [
        CustomAppBar(),
        ConnectionBox(),
        Obx(
          () => timerController.selectedCountry.value.countryName?.isNotEmpty ??
                  false
              ? StatsWidget()
              : NoConnectionRow(),
        ),
        FreeLocationRow(),
        LocationList(),
      ],
    );
  }
}
