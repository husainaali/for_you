import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_you/views/wrapper_view/wrapper_view.dart';
import 'package:for_you/views/wrapper_view/wrapper_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../constants/strings.dart';
import '../../routes/routes.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';


class SettingPageViewModel extends BaseModel {
  final WrapperViewModel wrapperViewModel = locator.get<WrapperViewModel>();
  final SharedPreferenceService _sharedPreferenceService = locator.get<SharedPreferenceService>();

      initialize() {}

      logout(BuildContext context){
                                     _sharedPreferenceService.removeData(AppString.isUserLogInKey);

                        wrapperViewModel.selectedItem = 5;
                        notifyListeners();
                        context.go(LoginPageViewRoute.path); 
      }

}