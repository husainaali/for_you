import 'dart:convert';
import 'package:for_you/models/countries.dart';
import 'package:for_you/models/shipment_methods.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

import '../constants/constants_helper.dart';

class CalculatorServices {
  final ReactiveValue<List<Country>> _countries = ReactiveValue([]);
  final ReactiveValue<List<ShippingMethods>> _shipmentMethods =
      ReactiveValue([]);

  List<Country>? get countries => _countries.value;

  List<ShippingMethods>? get shipmentMethods => _shipmentMethods.value;

  Future<bool> getAllCountriesAndCities() async {
    bool status = false;
    var tempCountriesList = <Country>[];
    _countries.value.clear();
    final String apiUrl =
        AppConfig.appBaseUrl + AppConfig.getCountriesCitiesData;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {},
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data != null && data.isNotEmpty) {
        for (var i = 0; i < data.length; i++) {
          Country tempCountriesData = Country();
          tempCountriesData = Country.fromJson(data[i]);

          tempCountriesList.add(tempCountriesData);
          print(tempCountriesData.countryName);
          status = true;
        }
        _countries.value.addAll(tempCountriesList);
      }

      return status;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> getShipmentMethods(
      String fromCountryID, String toCountryID, String type) async {
    bool status = false;
    final String apiUrl = AppConfig.appBaseUrl + AppConfig.getShipmentMethod;
    var tempMethodsList = <ShippingMethods>[];
    _shipmentMethods.value.clear();
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'shippingType': type,
        'fromCountryId': fromCountryID,
        'toCountryId': toCountryID,
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data != null && data.isNotEmpty) {
        for (var items in data) {
          ShippingMethods tempShipmentMethods = ShippingMethods();
          tempShipmentMethods = ShippingMethods.fromJson(items);
          tempMethodsList.add(tempShipmentMethods);
        }
        _shipmentMethods.value.addAll(tempMethodsList);
      }
      status = true; // Update status if request is successful
    } else {
      throw Exception('Failed to load data');
    }

    return status;
  }
}
