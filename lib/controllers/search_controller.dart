import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/constant/country_list.dart';
import '../models/country_model.dart';

class SearchFilterController extends GetxController {
  RxString searchText = "".obs;
  final searchFilterController = TextEditingController();

  void updateSearchText(String value) {
    searchText.value = value;
  }

  List<CountryModel> get filteredCountries {
    final text = searchText.value.toLowerCase();
    if (text.isEmpty) return countries;
    return countries
        .where((country) =>
            (country.countryName ?? "").toLowerCase().contains(text))
        .toList();
  }

  @override
  void onClose() {
    searchFilterController.dispose();
    super.onClose();
  }
}
