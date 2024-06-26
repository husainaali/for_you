import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:for_you/views/wrapper_view/wrapper_view.dart';
import 'package:for_you/views/wrapper_view/wrapper_view_model.dart';
import 'package:go_router/go_router.dart';

import '../../constants/strings.dart';
import '../../models/user.dart';
import '../../routes/routes.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';

class SettingPageViewModel extends BaseModel {
  Uint8List? _imageBytes;

  final WrapperViewModel wrapperViewModel = locator.get<WrapperViewModel>();
  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();
  int selectedPickUpAdressIndex = 0;

  User? userData;

  File? mediaFile;
  initialize() async {
    setBusy(true);
    Map<String, dynamic> userInfo;
    await _sharedPreferenceService
        .getStringData(AppString.userData)
        .then((userDataValue) {
      if (userDataValue != "") {
        userInfo = json.decode(userDataValue);
        userData = User.fromJson(userInfo);
      }
    });
    setBusy(false);
  }

  logout(BuildContext context) {
    _sharedPreferenceService.removeData(AppString.isUserLogInKey);
    _sharedPreferenceService.removeData(AppString.userData);

    wrapperViewModel.selectedItem = 5;
    notifyListeners();
    context.go(LoginPageViewRoute.path);
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      mediaFile = File(pickedFile.path);
    }
    notifyListeners();

    print(mediaFile);
  }

  void getMedia(BuildContext context, String s) {}
}
