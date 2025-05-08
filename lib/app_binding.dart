import 'package:get/get.dart';
import 'package:ttnetcase/controllers/search_controller.dart';
import 'package:ttnetcase/controllers/timer_controller.dart';
import 'package:ttnetcase/core/theme/theme_controller.dart';

import 'controllers/bottom_bar_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.lazyPut<TimerController>(() => TimerController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<SearchFilterController>(() => SearchFilterController());
  }
}
