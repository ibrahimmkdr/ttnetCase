import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/core/constant/country_list.dart';
import 'package:ttnetcase/widgets/home/country_list_card.dart';

import '../../controllers/search_controller.dart';

class LocationList extends StatelessWidget {
  const LocationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchFilterController>();

    return Obx(
      () {
        final searchText = searchController.searchText.value.toLowerCase();
        final filteredCountries = searchText.isEmpty
            ? countries
            : countries.where(
                (country) {
                  final name = (country.countryName ?? "").toLowerCase();
                  return name.contains(searchText);
                },
              ).toList();
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final country = filteredCountries[index];
              return CountryListCard(countryInfo: country);
            },
            childCount: filteredCountries.length,
          ),
        );
      },
    );
  }
}
