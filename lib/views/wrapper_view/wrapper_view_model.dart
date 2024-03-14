import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:for_you/routes/routes.dart';
import 'package:for_you/views/home_view/home_page_view.dart';
import 'package:for_you/views/login_view/login_page_view.dart';
import 'package:for_you/views/wrapper_view/wrapper_view.dart';
import 'package:go_router/go_router.dart';

import '../../constants/strings.dart';
import '../../models/user.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';
import '../home_employee/home_employee_page_view.dart';
import '../home_manager/home_manager_page_view.dart';

class WrapperViewModel extends BaseModel {
  late bool _loggedIn;
  bool get loggedIn => _loggedIn;
  WrapperViewModel() {
    _loggedIn = false;
  }

  User? userData;

  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();

  int selectedItem = 5;
  Widget? selectedPage;

  void initialize(BuildContext context) async {
    setBusy(true);
    Map<String, dynamic> userInfo;

    await isLogin().whenComplete(() async {
      await _sharedPreferenceService
          .getStringData(AppString.userData)
          .then((userDataValue) => {
                if (userDataValue != "")
                  {
                    userInfo = json.decode(userDataValue),
                    userData = User.fromJson(userInfo),
                  }
                else
                  {
                    context.go(LoginPageViewRoute.path),
                  }
              });

      if (userData != null && userData != "") {
        if (userData?.role == 'User') {
          selectedPage = const HomePageView();
          selectedItem = 0;
        } else if (userData?.role == 'Manager') {
          selectedPage = const HomeManagerPageView();
          selectedItem = 0;
        } else {
          selectedPage = const HomeEmployeePageView();
          selectedItem = 0;
        }
      } else {
        _loggedIn = false;
      }
      setBusy(false);
      notifyListeners();
    });
  }

  Future<void> changePage(BuildContext context) async {
    context.go(WrapperRoute.path);
    notifyListeners();
  }

  Future<void> isLogin() async {
    await _sharedPreferenceService
        .getBoolData(AppString.isUserLogInKey)
        .then((value) async {
      print(value);
      _loggedIn = value;
      if (_loggedIn) {
        print('object $_loggedIn');

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
