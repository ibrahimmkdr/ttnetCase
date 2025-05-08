import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/views/home/widgets/free_location_row.dart';

import '../../../controller/timer_controller.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/connection_row.dart';
import '../widgets/location_list.dart';
import '../widgets/stats_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerController = Get.find<TimerController>();
    return CustomScrollView(
      slivers: [
        CustomAppBar(),
        ConnectionRow(),
        Obx(
          () => timerController.selectedCountry.value.countryName?.isNotEmpty ??
                  false
              ? StatsWidget()
              : SliverToBoxAdapter(),
        ),
        FreeLocationRow(),
        LocationList(),
      ],
    );
  }
}
