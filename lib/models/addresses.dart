import 'package:json_annotation/json_annotation.dart';

import 'countries.dart';

part 'addresses.g.dart';

@JsonSerializable()
class Addresses {
  @JsonKey(name: 'address_id')
  int? addressId;
  @JsonKey(name: 'address_name')
  String? addressName;
  @JsonKey(name: 'address_line_1')
  String? addressLine1;
  @JsonKey(name: 'address_line_2')
  String? addressLine2;
  @JsonKey(name: 'country_id')
  int? countryId;
  @JsonKey(name: 'country_name')
  String? countryName;
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'city_name')
  String? cityName;

  Addresses(
      {this.addressId,
      this.addressName,
      this.addressLine1,
      this.addressLine2,
      this.countryId,
      this.countryName,
      this.cityId,
      this.cityName,
      });
  factory Addresses.fromJson(Map<String, dynamic> json) =>
      _$AddressesFromJson(json);

  Map<String, dynamic> toJson() => _$AddressesToJson(this);
}
