class CountryModel {
  final String? id;
  final String? flagCode;
  final String? countryName;
  final int? locationCount;
  final List<String>? countryCity;
  final String? strength;
  final bool? isPremium;

  CountryModel({
    this.id,
    this.flagCode,
    this.countryName,
    this.locationCount,
    this.countryCity,
    this.strength,
    this.isPremium,
  });
}
