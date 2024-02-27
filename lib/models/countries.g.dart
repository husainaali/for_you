// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      countryId: json['country_id'] as int?,
      countryName: json['country_name'] as String?,
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'cities': instance.cities,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      cityId: json['city_id'] as int?,
      cityName: json['city_name'] as String?,
      countryId: json['country_id'] as int?,
      zipCode: json['zip_code'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'city_id': instance.cityId,
      'city_name': instance.cityName,
      'country_id': instance.countryId,
      'zip_code': instance.zipCode,
    };
