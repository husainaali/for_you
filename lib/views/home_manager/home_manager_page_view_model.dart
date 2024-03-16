import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../models/addresses.dart';
import '../../view_models/base_model.dart';

class HomeManagerPageViewModel extends BaseModel {
  int isForYouBtnSelected = 0;
  List<String> managerHomeLists = [];
  final ReactiveValue<List<Addresses>> _addresses = ReactiveValue([]);
  List<Addresses> get addresses => _addresses.value;
  int selectedPickUpAdressIndex = 0;

  int lIndex = 0;

  initialize() async {
    setBusy(true);
    await getManagerHomeLists();
    setBusy(false);
  }

  getManagerHomeLists() {
    managerHomeLists = [
      'For You Today',
      'From You Today',
      'New Requests',
      'Delivered'
    ];
  }

  sendManagerShipmentInitialize(BuildContext context) {}

  generalRequester({required String pagename}) {}
}
