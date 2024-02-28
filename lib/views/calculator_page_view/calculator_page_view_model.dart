import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_you/routes/routes.dart';
import 'package:for_you/views/calculator_page_view/send_shipment_page_view.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../models/countries.dart';
import '../../services/calculator_services.dart';
import '../../services/locator_service.dart';
import '../../view_models/base_model.dart';

class CalculatorPageViewModel extends BaseModel {
  final CalculatorServices _calculatorServices =
      locator.get<CalculatorServices>();

  final ReactiveValue<List<Country>> _countryList = ReactiveValue([]);
  final ReactiveValue<List<City>> _fromCities = ReactiveValue([]);
  final ReactiveValue<List<City>> _toCities = ReactiveValue([]);

  var selectedCity;

  bool weightRadioButton = true;

  bool shippingType =true;

  List<Country> get countryList => _countryList.value;
  List<City> get fromCities => _fromCities.value;
  List<City> get toCities => _toCities.value;
  late BuildContext context;
  initialize(calculatorContext) async {
    context = calculatorContext;
    setBusy(true);
    await getCountries();
    await _calculatorServices.getShipmentMethods(1,1,'normal');
    setBusy(false);
  }

  sendShipmentInitialize(sendShipmentContext) {
    context = sendShipmentContext;
  }
  Future getCountries() async {
    _countryList.value = [];
    await _calculatorServices.getAllCountriesAndCities().whenComplete(() => {
          _countryList.value = _calculatorServices.countries!,
          print('countries list ready')
        });
  }

  selectCountry(listName, selectedCoutryName) {
    print(listName);
    if (listName == 'FromCountry') {
      selectedCity = null;

      _fromCities.value = [];
      _fromCities.value = countryList
              .where((element) => element.countryName == selectedCoutryName)
              .first
              .cities ??
          [];
      notifyListeners();
      // print(fromCities.last.cityName);
    } else if (listName == 'ToCountry') {
      _toCities.value = [];
      _toCities.value = countryList
              .where((element) => element.countryName == selectedCoutryName)
              .first
              .cities ??
          [];
      notifyListeners();
      // print(toCities.last.cityName);
    }
  }

  shipmentInformation() {}
  generalRequester({pagename}) {
    context.push(SendShipmentPageViewRoute.path);


  }
}
