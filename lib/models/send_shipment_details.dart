import 'package:json_annotation/json_annotation.dart';
part 'send_shipment_details.g.dart';

@JsonSerializable()
class SendShipmentDetails {
  int? customerId;
  int? countryFromId;
  int? cityFromID;
  int? countryToId;
  int? cityToId;
  double? weight;
  double? rate;
  double? calculatedWeight;
  String? weightUnit;
  String? shippingType;
  int? selectedMethodId;
  String? pickupAddress;
  String? pickupDateTime;
  String? dropAddress;
  String? dropDateTime;

  SendShipmentDetails({
    this.customerId,
    this.countryFromId,
    this.cityFromID,
    this.countryToId,
    this.cityToId,
    this.weight,
    this.rate,
    this.calculatedWeight,
    this.weightUnit,
    this.shippingType,
    this.selectedMethodId,
    this.pickupAddress,
    this.pickupDateTime,
    this.dropAddress,
    this.dropDateTime,
  });

     factory SendShipmentDetails.fromJson(Map<String, dynamic> json) =>
      _$SendShipmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SendShipmentDetailsToJson(this);
}
