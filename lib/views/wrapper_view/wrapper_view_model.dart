import 'package:flutter/material.dart';
import 'package:for_you/routes/routes.dart';
import 'package:for_you/views/home_view/home_page_view.dart';
import 'package:for_you/views/login_view/login_page_view.dart';
import 'package:for_you/views/wrapper_view/wrapper_view.dart';
import 'package:go_router/go_router.dart';

import '../../constants/strings.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';

class WrapperViewModel extends BaseModel {
  late bool _loggedIn;
  bool get loggedIn => _loggedIn;
  WrapperViewModel() {
    _loggedIn = false;
  }
  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();

  int selectedItem = 0;
  Widget selectedPage = const HomePageView();

  void initialize() async {
    setBusy(true);

    await login();

    setBusy(false);
    notifyListeners();
  }

  Future<void> changePage(BuildContext context) async {
    context.go(WrapperRoute.path);
    notifyListeners();
  }

  login() async {
    await _sharedPreferenceService
        .getBoolData(AppString.isUserLogInKey)
        .then((value) async {
      print(value);
      _loggedIn = value;
      if (_loggedIn) {
        print('object $_loggedIn');
        selectedPage = const HomePageView();
        notifyListeners();
      } else {
        selectedItem = 5;
      }
    });
  }

  Future<void> onNavigationBarTapped(itemIndex) async {
    selectedItem = itemIndex;

    notifyListeners();
  }
}
