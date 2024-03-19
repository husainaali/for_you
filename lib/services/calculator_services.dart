import 'dart:convert';
import 'package:for_you/models/addresses.dart';
import 'package:for_you/models/countries.dart';
import 'package:for_you/models/shipment_methods.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

import '../constants/constants_helper.dart';

class CalculatorServices {
  final ReactiveValue<List<Country>> _countries = ReactiveValue([]);
  final ReactiveValue<List<ShippingMethods>> _shipmentMethods =
      ReactiveValue([]);
  final ReactiveValue<List<Addresses>> _addresses = ReactiveValue([]);

  List<Country>? get countries => _countries.value;

  List<ShippingMethods>? get shipmentMethods => _shipmentMethods.value;
  List<Addresses>? get addresses => _addresses.value;

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

  Future<bool> addOrUpdateAddress({
    required String userID,
    required String role,
    required String requestName,
    required String addressId,
    required String addressName,
    required String addressLine1,
    required String addressLine2,
    required String cityId,
    required String countryId,
    required String lat,
    required String lng,
  }) async {
    final String apiUrl = AppConfig.appBaseUrl +
        AppConfig.addUpdateAddress;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'userId':userID,
          'role':role,
          'addressId': requestName == 'newAddress' ? '-1' : addressId,
          'addressName': addressName,
          'addressLine1': addressLine1,
          'addressLine2': addressLine2,
          'cityId': cityId,
          'countryId': countryId,
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Response data: $responseData');

        if (responseData != null && responseData['success'] == true) {
          return true; // Address added/updated successfully
        } else {
          throw Exception(
              responseData['error'] ?? 'Unknown error'); // Registration failed
        }
      } else {
        throw Exception('Failed to add/update address'); // HTTP request failed
      }
    } catch (e) {
      print('Error: $e'); // Handle error here
      return false;
    }
  }


Future<bool> getAddresses(
      userId) async {
    bool status = false;
    final String apiUrl = AppConfig.appBaseUrl + AppConfig.getAddresses;
    var tempAddressesList = <Addresses>[];
    _addresses.value.clear();
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'user_id': '$userId',
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data != null && data.isNotEmpty) {
        for (var items in data) {
          Addresses tempAddresses = Addresses();
          tempAddresses = Addresses.fromJson(items);
          tempAddressesList.add(tempAddresses);
        }
        _addresses.value.addAll(tempAddressesList);
      }
      status = true; // Update status if request is successful
    } else {
      throw Exception('Failed to load data');
    }

    return status;
  }

}
