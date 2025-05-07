import 'package:flutter/material.dart';
import 'package:ttnetcase/views/home/widgets/free_location_row.dart';

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
    return CustomScrollView(
      slivers: [
        CustomAppBar(),
        ConnectionRow(),
        StatsWidget(),
        FreeLocationRow(),
        LocationList(),
      ],
    );
  }
}
