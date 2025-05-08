import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttnetcase/models/country_model.dart';

import '../core/theme/app_color.dart';

class CityView extends StatelessWidget {
  final CountryModel countryInfo;

  CityView({super.key, required this.countryInfo});
  final appColor = ColorTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.scaffoldColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.arrow_back,
              color: appColor.titleColor,
            )),
        backgroundColor: appColor.appbarColor,
        title: Text(
          "${countryInfo.countryName}",
          style: TextStyle(
            color: appColor.titleColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: countryInfo.countryCity?.length ?? 0,
          itemBuilder: (context, index) {
            final cityName = countryInfo.countryCity?[index] ?? "";
            return _cityCard(cityName: cityName);
          },
        ),
      ),
    );
  }

  Widget _cityCard({required String cityName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 4),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: appColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(Icons.location_on, color: appColor.blue, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                cityName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: appColor.black,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
