import 'package:get/get.dart';
import 'package:ttnetcase/controller/search_controller.dart';
import 'package:ttnetcase/controller/timer_controller.dart';

import 'controller/bottom_bar_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimerController>(() => TimerController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<SearchFilterController>(() => SearchFilterController());
  }
}
