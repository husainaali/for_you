// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_shipment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendShipmentDetails _$SendShipmentDetailsFromJson(Map<String, dynamic> json) =>
    SendShipmentDetails(
      customerId: json['customerId'] as int?,
      countryFromId: json['countryFromId'] as int?,
      cityFromID: json['cityFromID'] as int?,
      countryToId: json['countryToId'] as int?,
      cityToId: json['cityToId'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      calculatedWeight: (json['calculatedWeight'] as num?)?.toDouble(),
      weightUnit: json['weightUnit'] as String?,
      shippingType: json['shippingType'] as String?,
      selectedMethodId: json['selectedMethodId'] as int?,
      pickupAddress: json['pickupAddress'] as String?,
      pickupDateTime: json['pickupDateTime'] as String?,
      dropAddress: json['dropAddress'] as String?,
      dropDateTime: json['dropDateTime'] as String?,
    );

Map<String, dynamic> _$SendShipmentDetailsToJson(
        SendShipmentDetails instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'countryFromId': instance.countryFromId,
      'cityFromID': instance.cityFromID,
      'countryToId': instance.countryToId,
      'cityToId': instance.cityToId,
      'weight': instance.weight,
      'rate': instance.rate,
      'calculatedWeight': instance.calculatedWeight,
      'weightUnit': instance.weightUnit,
      'shippingType': instance.shippingType,
      'selectedMethodId': instance.selectedMethodId,
      'pickupAddress': instance.pickupAddress,
      'pickupDateTime': instance.pickupDateTime,
      'dropAddress': instance.dropAddress,
      'dropDateTime': instance.dropDateTime,
    };
