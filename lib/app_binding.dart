import 'package:get/get.dart';

import 'controller/bottom_bar_controller.dart';
import 'controller/timer_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimerController>(() => TimerController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
