import 'dart:async';

import 'package:flutter/material.dart';

import '../../services/locator_service.dart';
import '../../view_models/base_model.dart';

class HomePageViewModel extends BaseModel {
  List<String> adsList = [
    'assets/ads.png',
    'assets/ads2.png',
    'assets/ads3.png',
    'assets/ads4.png',
    'assets/ads5.png'
  ];

  int currentAdsIndex = 0;

  initialize() {
      adsTimer();
  }

  adsTimer(){
        Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentAdsIndex < 4) {
        currentAdsIndex += 1;
      } else {
        currentAdsIndex = 0;
      }
      notifyListeners();
    });
  }
}
