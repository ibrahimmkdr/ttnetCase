import 'package:ttnetcase/models/country_model.dart';

final List<CountryModel> countries = [
  CountryModel(
      flagCode: 'it',
      countryName: 'Italy',
      locationCount: 3,
      id: 'it1',
      isPremium: true,
      strength: "70",
      countryCity: ["Roma", "paris", "milano"]),
  CountryModel(
      flagCode: 'ug',
      countryName: 'Uganda',
      locationCount: 3,
      id: 'ug1',
      isPremium: true,
      strength: "59",
      countryCity: ["kampala", "Mbale"]),
  CountryModel(
      flagCode: 'tr',
      countryName: 'Turkey',
      locationCount: 4,
      id: '  tr2',
      isPremium: true,
      strength: "72",
      countryCity: ["Istanbul", "Bursa", "Ankara", "Eskişehir"]),
  CountryModel(
      flagCode: 'de',
      countryName: 'Germany',
      locationCount: 3,
      id: 'de1',
      strength: "34",
      countryCity: [
        "Berlin",
        "Hamburg",
        "Frankfurt",
      ]),
  CountryModel(
      flagCode: 'nl',
      countryName: 'Netherlands',
      countryCity: ["Rotterdam", "Amsterdam"],
      locationCount: 4,
      strength: "29",
      id: 'nl1'),
  CountryModel(
      flagCode: 'it',
      countryName: 'Italy',
      locationCount: 3,
      id: ' it2',
      strength: "32",
      countryCity: ["Roma"]),
  CountryModel(
      flagCode: 'tr',
      countryName: 'Turkey',
      locationCount: 3,
      id: 'tr3',
      strength: "97",
      countryCity: ["Istanbul"]),
  CountryModel(
      flagCode: 'de',
      countryName: 'Germany',
      locationCount: 5,
      id: 'de2',
      countryCity: ["Berlin"]),
  CountryModel(
      flagCode: 'nl',
      countryName: 'Netherlands',
      countryCity: ["Rotterdam"],
      locationCount: 4,
      id: 'nl2'),
];
