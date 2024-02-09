import 'dart:convert';

import 'package:drd_app/models/result.dart';
import 'package:drd_app/services/api_service.dart';
import 'package:drd_app/services/locator_service.dart';
import 'package:http/http.dart';

import '../constants/constants_helper.dart';

class UserService {
  ApiService apiService = locator.get<ApiService>();

  Future<Result> getUserData(String id) async {
    Result result = Result(status: false, data: {});
    try {
      Response response = await apiService.drdGetData(AppConfig.getUserData);
      if (response.statusCode == 200) {
        result = Result(status: true, data: json.decode(response.body));
      }
      return result;
    } catch (e) {
      return result;
    }
  }
}
