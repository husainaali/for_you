import 'dart:convert';

import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../models/user.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../services/user_service.dart';
import '../../view_models/base_model.dart';
import '../wrapper_view/wrapper_view_model.dart';

class EmployeesPageViewModel extends BaseModel {
  bool addEditEmployees = false;
  final WrapperViewModel wrapperViewModel = locator.get<WrapperViewModel>();
  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();
  final UserService userService = locator.get<UserService>();
  bool isEmployeeActive = true;
  User userInformation = User();
  User? userData;

  TextEditingController textControllerEmployeeFullName =
      TextEditingController();
  TextEditingController textControllerEmployeeUserName =
      TextEditingController();
  TextEditingController textControllerEmployeeContectNo =
      TextEditingController();
  TextEditingController textControllerUserPassword = TextEditingController();

  initialize() {}

  empRegisterFormInit() async {
    var tempUserData =
        await _sharedPreferenceService.getStringData(AppString.userData);
    Map<String, dynamic> userInfo = json.decode(tempUserData);
    userData = User.fromJson(userInfo);
    userInformation.managerId = userData!.userId;
    userInformation.role = 'Employee';
    return userInformation.isActive = true;
  }

  fillRegistrationForm(data, feildName) {
    switch (feildName) {
      case 'User Name':
        return userInformation.userName = data;
      case 'Full Name':
        return userInformation.fullName = data;
      case 'Personal ID':
        return userInformation.identityNo = data;
      case 'Email':
        return {userInformation.email = data, userInformation.userName = data};
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
      case 'Commercial Name':
        return userInformation.commercialName = data;
      case 'Commercial ID':
        return userInformation.commercialID = data;
      case 'isActive':
        return userInformation.isActive = data;
      case 'Company Size':
        // print(json.encode(userInformation.toJson()).toString());
        return userInformation.companySize = data;
    }
  }
}
