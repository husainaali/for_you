import 'package:json_annotation/json_annotation.dart';
part 'shipment_methods.g.dart';

@JsonSerializable()
class ShippingMethods {
  String? managerCommercialName;
  String? shippingRat;

  ShippingMethods({this.managerCommercialName, this.shippingRat});

  factory ShippingMethods.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodsFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodsToJson(this);
}
