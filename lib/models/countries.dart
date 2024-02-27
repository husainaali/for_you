import 'package:json_annotation/json_annotation.dart';

part 'countries.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: 'country_id')
  int? countryId;
  @JsonKey(name: 'country_name')
  String? countryName;
  List<City>? cities; // Change City to List<City>

  Country({this.countryId, this.countryName, this.cities});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'city_name')
  String? cityName;
  @JsonKey(name: 'country_id')
  int? countryId;
  @JsonKey(name: 'zip_code')
  String? zipCode; // Changed to String since the JSON contains strings

  City({this.cityId, this.cityName, this.countryId, this.zipCode});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
