import 'dart:convert';
import 'dart:math';
import 'package:for_you/models/countries.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

import '../constants/constants_helper.dart';

class CalculatorServices {
  final ReactiveValue<List<Country>> _countries = ReactiveValue([]);

  List<Country>? get countries => _countries.value;

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

 Future<bool> getShipmentMethods(fromCountryID, toCountryID, type) async {
  bool status = false;
  final String apiUrl = AppConfig.appBaseUrl + AppConfig.getShipmentMethod;
  
  // Encode the request body to JSON
  var body = json.encode({
    'shippingType': type,
    'fromCountryId': '$fromCountryID',
    'toCountryId': '$toCountryID',
  });
  
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'}, // Set Content-Type header
    body: body,
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    if (data != null && data.isNotEmpty) {
      // Process data if needed
    }
    status = true; // Update status if request is successful
  } else {
    throw Exception('Failed to load data');
  }
  
  return status;
}
}
