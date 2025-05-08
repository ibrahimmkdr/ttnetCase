import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  RxString searchText = "".obs;
  final searchFilterController = TextEditingController();

  void updateSearchText(String value) {
    searchText.value = value;
  }

  @override
  void onClose() {
    searchFilterController.dispose();
    super.onClose();
  }
}
