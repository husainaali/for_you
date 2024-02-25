import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../services/locator_service.dart';
import '../../services/user_service.dart';
import '../../view_models/base_model.dart';
import '../wrapper_view/wrapper_view_model.dart';

class LoginPageViewModel extends BaseModel {
  final WrapperViewModel wrapperViewModel = locator.get<WrapperViewModel>();
  final UserService userService = locator.get<UserService>();

  TextEditingController textControllerUserFullName = TextEditingController();
  TextEditingController textControllerUserCPR = TextEditingController();
  TextEditingController textControllerUserOccupation = TextEditingController();
  TextEditingController textControllerUserDOB = TextEditingController();
  TextEditingController textControllerUserAddress = TextEditingController();
  TextEditingController textControllerUserContactNo1 = TextEditingController();
  TextEditingController textControllerUserContactNo2 = TextEditingController();
  TextEditingController textControllerUserEmail = TextEditingController();
  TextEditingController textControllerUserPassword = TextEditingController();
  TextEditingController textControllerUserConfirmPassword =
      TextEditingController();

  TextEditingController textControllerManagerCommercialName =
      TextEditingController();
  TextEditingController textControllerManagerCommercialID =
      TextEditingController();
  TextEditingController textControllerManagerBusinessType =
      TextEditingController();
  TextEditingController textControllerManagerAddress = TextEditingController();
  TextEditingController textControllerManagerContactNo1 =
      TextEditingController();
  TextEditingController textControllerManagerContactNo2 =
      TextEditingController();

  User userInformation = User();

  bool isLoginPage = true;

  bool isUser = true;

  bool isPasswordConfirmed = false;
  initialize() {}
  registrationInitialize(userName, password) {
    userInformation.email = userName;
    userInformation.password = password;
  }

  Future<void> generalRequester(context) async {
    print('login page');
    wrapperViewModel.changePage(context);
  }

  fillRegistrationForm(data, feildName) {
    userInformation.role = isUser ? 'User' : 'Manager';
    switch (feildName) {
      case 'nameUser':
        return userInformation.userName = data;
      case 'Full Name':
        return userInformation.fullName = data;
      case 'Personal ID':
        return userInformation.identityNo = data;
      case 'Email':
        return {userInformation.email = data,
        userInformation.userName = data
        };
      case 'Password':
        return userInformation.password = data;
      case 'role':
        return userInformation.role = 'User';
      case 'Address':
        return userInformation.address = data;
      case 'Contact No. 1':
        return userInformation.contactNo1 = data;
      case 'Contact No. 2':
        return userInformation.contactNo2 = data;
    }
    print(json.encode(userInformation.toJson()).toString());
  }
}
