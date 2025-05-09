import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constant/app_text.dart';
import '../core/theme/app_color.dart';

class VipController extends GetxController {
  final appText = AppText();
  final appColor = ColorTheme();

  RxBool isVip = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadVip();
  }

  void loadVip() async {
    final pref = await SharedPreferences.getInstance();
    isVip.value = pref.getBool("isVip") ?? false;
  }

  void changeVip() async {
    final pref = await SharedPreferences.getInstance();
    isVip.value = !isVip.value;
    await pref.setBool("isVip", isVip.value);

    Get.snackbar(
      isVip.value ? appText.vipSucces : appText.vipUnSucces,
      isVip.value ? appText.vipSucMessage : appText.vipUnSucMessage,
      snackPosition: SnackPosition.TOP,
      backgroundColor: appColor.scaffoldColor,
      colorText: appColor.black,
    );
  }
}
