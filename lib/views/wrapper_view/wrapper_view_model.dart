import 'package:flutter/material.dart';
import 'package:for_you/views/home_view/home_page_view.dart';

import '../../view_models/base_model.dart';

class WrapperViewModel extends BaseModel {
  late bool _loggedIn;

  int selectedItem=0;
  Widget selectedPage = HomePageView();
  bool get loggedIn => _loggedIn;

  void initialize() async {
    setBusy(true);
    _loggedIn = true;
    setBusy(false);
    notifyListeners();
  }

  Future<void> onNavigationBarTapped(itemIndex)async{
    selectedItem = itemIndex;
    notifyListeners();
  }
}