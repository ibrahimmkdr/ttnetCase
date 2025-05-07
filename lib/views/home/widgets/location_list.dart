import 'package:flutter/material.dart';

import '../../../core/constant/country_list.dart';
import 'country_list_card.dart';

class LocationList extends StatelessWidget {
  const LocationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CountryListCard(
            countryInfo: countries[index],
          );
        },
        childCount: countries.length,
      ),
    );
  }
}
