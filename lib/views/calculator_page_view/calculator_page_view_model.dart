import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:for_you/models/addresses.dart';
import 'package:for_you/models/send_shipment_details.dart';
import 'package:for_you/models/shipment_methods.dart';
import 'package:for_you/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

import '../../constants/strings.dart';
import '../../models/countries.dart';
import '../../models/user.dart';
import '../../services/calculator_services.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';

class CalculatorPageViewModel extends BaseModel {
  final CalculatorServices _calculatorServices =
      locator.get<CalculatorServices>();
  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();
  final ReactiveValue<List<Country>> _countryList = ReactiveValue([]);
  final ReactiveValue<List<City>> _fromCities = ReactiveValue([]);
  final ReactiveValue<List<City>> _toCities = ReactiveValue([]);
  final ReactiveValue<List<ShippingMethods>> _shippingMethods =
      ReactiveValue([]);
  final ReactiveValue<List<Addresses>> _addresses = ReactiveValue([]);
  final ReactiveValue<Addresses> _pickAddresses = ReactiveValue(Addresses());
  final ReactiveValue<Addresses> _dropAddresses = ReactiveValue(Addresses());

  final ReactiveValue<SendShipmentDetails> _sendShipmentDetails =
      ReactiveValue(SendShipmentDetails());

  TextEditingController textControllerWeightCounter = TextEditingController();

  bool weightRadioButton = true;
  bool addEditNewAddress = false;
  bool showShippingMethods = false;
  List<Marker> markers = [];

  double? packageWeight = 0.0;

  bool? shippingTypeNormal = null;

  bool? shippingTypefast = null;

  int shippingMethodSelectedIndex = 0;
  int selectedPickUpAdressIndex = 0;

  List<Country> get countryList => _countryList.value;
  List<City> get fromCities => _fromCities.value;
  List<City> get toCities => _toCities.value;
  List<ShippingMethods> get shippingMethods => _shippingMethods.value;
  SendShipmentDetails get sendShipmentDetails => _sendShipmentDetails.value;
  List<Addresses> get addresses => _addresses.value;
  Addresses get pickAddresses => _pickAddresses.value;
  Addresses get dropAddresses => _dropAddresses.value;

  
  User? userData;

  TextEditingController textControllerAddressName = TextEditingController();
  TextEditingController textControllerAddressLine1 = TextEditingController();
  TextEditingController textControllerAddressLine2 = TextEditingController();
  String lat='';
  String lng='';
  late BuildContext context;

  Map<String, String> addressData = {
    'userID': '',
    'requestName': '',
    'addressId': '',
    'addressName': '',
    'addressLine1': '',
    'addressLine2': '',
    'cityId': '',
    'countryId': '',
  };

  initialize(calculatorContext) async {
    textControllerWeightCounter.text = '0.0';
    context = calculatorContext;

    setBusy(true);
    shipmentInformation(1, 'customerId');
    shipmentInformation('kg', 'weightUnit');
    await getCountries();
    setBusy(false);
  }

  sendShipmentInitialize(
      sendShipmentContext, SendShipmentDetails sendShipmentDetails) async {
    context = sendShipmentContext;
    _sendShipmentDetails.value = sendShipmentDetails;

    var tempUserData =
        await _sharedPreferenceService.getStringData(AppString.userData);
    Map<String, dynamic> userInfo = json.decode(tempUserData);
    userData = User.fromJson(userInfo);
    addressData['userID'] = '${userData!.userId}';
    print(userData!.userId);
    getAddresses(userData!.userId);
  }

  Future getCountries() async {
    _countryList.value = [];
    await _calculatorServices.getAllCountriesAndCities().whenComplete(() => {
          _countryList.value = _calculatorServices.countries!,
          print('countries list ready')
        });
  }

  selectCountry(listName, selectedCoutryName) {
    if (listName == 'FromCountry' || listName == 'AddressCountry') {
      _fromCities.value = [];
      _fromCities.value = countryList
              .where((element) => element.countryName == selectedCoutryName)
              .first
              .cities ??
          [];
      notifyListeners();
      // print(fromCities.last.cityName);
    } else if (listName == 'ToCountry' || listName == 'AddressCountry') {
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

  Future<void> getShippingMethods(
      countryFromId, countryToId, shippingType) async {
    try {
      _shippingMethods.value.clear();
      await _calculatorServices
          .getShipmentMethods('$countryFromId', '$countryToId', '$shippingType')
          .then((status) => {
                if (status)
                  {
                    _shippingMethods.value =
                        _calculatorServices.shipmentMethods!,
                    showShippingMethods = true,
                  }
              });
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  shipmentInformation(dynamic data, dataname) {
    switch (dataname) {
      case 'customerId':
        return _sendShipmentDetails.value.customerId = 1;
      case 'countryFromId':
        return _sendShipmentDetails.value.countryFromId = data;
      case 'cityFromID':
        return _sendShipmentDetails.value.cityFromID = data;
      case 'countryToId':
        return _sendShipmentDetails.value.countryToId = data;
      case 'cityToId':
        return _sendShipmentDetails.value.cityToId = data;
      case 'weight':
        return _sendShipmentDetails.value.weight = data;
      case 'rate':
        return _sendShipmentDetails.value.rate = data;
      case 'calculatedWeight':
        return _sendShipmentDetails.value.calculatedWeight = data;
      case 'weightUnit':
        return _sendShipmentDetails.value.weightUnit = data;
      case 'shippingType':
        return _sendShipmentDetails.value.shippingType = data;
      case 'selectedMethodId':
        return _sendShipmentDetails.value.selectedMethodId = data;
      case 'pickupAddress':
        return _sendShipmentDetails.value.pickupAddress = data;
      case 'pickupDateTime':
        return _sendShipmentDetails.value.pickupDateTime = data;
      case 'dropAddress':
        return _sendShipmentDetails.value.dropAddress = data;
      case 'dropDateTime':
        return _sendShipmentDetails.value.dropDateTime = data;
    }
  }

  generalRequester({pagename}) {
    validateShippingInformation('nextPage');
  }

  validateShippingInformation(requestName) {
    if (sendShipmentDetails.customerId != null) {
      if (sendShipmentDetails.countryFromId != null) {
        if (sendShipmentDetails.cityFromID != null) {
          if (sendShipmentDetails.countryToId != null) {
            if (sendShipmentDetails.cityToId != null) {
              if (sendShipmentDetails.weight != null) {
                if (sendShipmentDetails.weightUnit != null) {
                  if (sendShipmentDetails.shippingType != null) {
                    if (requestName == 'callMethods') {
                      getShippingMethods(
                          sendShipmentDetails.countryFromId,
                          sendShipmentDetails.countryToId,
                          sendShipmentDetails.shippingType);
                    }
                    if (sendShipmentDetails.selectedMethodId != null) {
                      if (requestName == 'nextPage') {
                        context.push(SendShipmentPageViewRoute.path, extra: {
                          'sendShipmentDetails': _sendShipmentDetails.value
                        });
                      }
                      if (sendShipmentDetails.pickupAddress != null) {
                        if (sendShipmentDetails.pickupDateTime != null) {
                          if (sendShipmentDetails.dropAddress != null) {
                            if (sendShipmentDetails.dropDateTime != null) {
                            } else {
                              //drop time null
                            }
                          } else {
                            //drop address null
                          }
                        } else {
                          //pickup time null
                        }
                      } else {
                        //pickup address null
                      }
                    } else {
                      //shipping method null
                    }
                  } else {
                    //shipping type null
                  }
                } else {
                  //weight unit null
                }
              } else {
                //weight null
              }
            } else {
              //city to null
            }
          } else {
            //country to null
            print('ccountry to null');
          }
        } else {
          //city from null
          print('city from null');
        }
      } else {
        //country from null
        print('country from null');
      }
    } else {
      print('customer null');
      //customer null
    }
  }

  double convertToNearestPointFive(double input) {
    if (input <= 0.5) {
      return 0.5;
    } else {
      return (input.ceil()).toDouble();
    }
  }

  double totalPrice(double rate) {
    double? price;
    double? weight;

    if (sendShipmentDetails.weightUnit == 'lb') {
      weight = sendShipmentDetails.weight! * 0.45359237;
    } else {
      weight = sendShipmentDetails.weight!;
    }
    weight = convertToNearestPointFive(weight);
    sendShipmentDetails.calculatedWeight = weight;
    sendShipmentDetails.rate = rate;
    price = weight * rate;
    return double.parse(price.toStringAsFixed(1));
  }

  void changeToEditAddress() {
    addEditNewAddress = !addEditNewAddress;
    notifyListeners();
  }

  addressesControlPageInitialize(BuildContext context, addressId) async {
    print('address id $addressId');
    var tempUserData =
        await _sharedPreferenceService.getStringData(AppString.userData);
    Map<String, dynamic> userInfo = json.decode(tempUserData);
    userData = User.fromJson(userInfo);
    addressData['userID'] = '${userData!.userId}';
    addressData['role'] = '${userData!.role}';
    print(userData!.userId);
    getAddresses(userData!.userId);
    await getCountries();
  }

  Future<void> saveAddress() async {
    await _calculatorServices
        .addOrUpdateAddress(
          userID: addressData['userID'] ?? '',
          role:addressData['role']??'',
          requestName: addressData['requestName'] ?? '',
          addressId: addressData['addressId'] ?? '',
          addressName: addressData['addressName'] ?? '',
          addressLine1: addressData['addressLine1'] ?? '',
          addressLine2: addressData['addressLine2'] ?? '',
          cityId: addressData['cityId'] ?? '',
          countryId: addressData['countryId'] ?? '',
          lat: addressData['lat'] ?? '',
          lng: addressData['lng'] ?? '',
        )
        .then((value) => {});
  }

  Future<void> getAddresses(userId) async {
    _addresses.value.clear();
    await _calculatorServices.getAddresses(userId).then((value) => {
          if (value)
            {
              _addresses.value = _calculatorServices.addresses!,
            }
        });
    notifyListeners();
  }

  String addressLableText(Addresses address) {
    String addressText;

    addressText =
        '${address.addressName} - ${address.cityName}(${address.countryName})-${address.addressLine1}- ${address.addressLine2}';

    return addressText;
  }


  Future<void> handleTap(LatLng latLng,context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Data'),
          content: Text('Do you want to add data at this location?'),
          actions: <Widget>[
            FilledButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FilledButton(
              child: Text('Add'),
              onPressed: () {
                addMarker(latLng);
                Navigator.of(context).pop();
                notifyListeners();
                // Here you can handle data recording or any other action you want to take
              },
            ),
          ],
        );
      },
    );
  }

    void addMarker(LatLng latLng) {
  lat = '${latLng.latitude}';
  lng = '${latLng.longitude}';
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: latLng,
          child:Icon(
            Icons.pin_drop,
            color: Colors.red,
          ), 
        ),
      );
    
  }
}
