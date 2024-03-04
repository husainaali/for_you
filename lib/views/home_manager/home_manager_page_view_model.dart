import 'dart:async';

import 'package:flutter/material.dart';

import '../../services/locator_service.dart';
import '../../view_models/base_model.dart';

class HomeManagerPageViewModel extends BaseModel {
  int isForYouBtnSelected = 0;
  List<String> managerHomeLists = [];

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
}
