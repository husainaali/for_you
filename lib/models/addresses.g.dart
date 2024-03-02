// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Addresses _$AddressesFromJson(Map<String, dynamic> json) => Addresses(
      addressId: json['address_id'] as int?,
      addressName: json['address_name'] as String?,
      addressLine1: json['address_line_1'] as String?,
      addressLine2: json['address_line_2'] as String?,
      countryId: json['country_id'] as int?,
      countryName: json['country_name'] as String?,
      cityId: json['city_id'] as int?,
      cityName: json['city_name'] as String?,
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'address_id': instance.addressId,
      'address_name': instance.addressName,
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'city_id': instance.cityId,
      'city_name': instance.cityName,
    };
