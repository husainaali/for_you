import 'dart:convert';

import 'package:for_you/services/api_service.dart';
import 'package:for_you/services/locator_service.dart';
import '../constants/constants_helper.dart';

import 'package:http/http.dart' as http;

import '../constants/strings.dart';
import '../models/user.dart';
import 'shared_preferences_service.dart';

class UserService {
  ApiService apiService = locator.get<ApiService>();
  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();
Future<bool> loginUser(String username, String password) async {
  final String apiUrl = AppConfig.appBaseUrl + AppConfig.getUserData;

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'username': username,
        'password': password,
      },
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print('Response data: $responseData');

      if (responseData != null && responseData['success'] == true) {
                  await _sharedPreferenceService.saveData(AppString.isUserLogInKey, true);

        return true; // Login successful
      } else {
        throw Exception(responseData['error'] ?? 'Unknown error'); // Login failed
      }
    } else {
      throw Exception('Failed to login'); // HTTP request failed
    }
  } catch (e) {
    print('Error: $e'); // Handle error here
    return false;
  }
}


  Future<bool> registerUser(User userData) async {
  final String apiUrl = AppConfig.appBaseUrl + AppConfig.registerUserData;

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'username': userData.email,
        'password': userData.password ?? 'admin',
        'email': userData.email ?? '',
        'fullName': userData.fullName ?? '',
        'address': userData.address ?? '',
        'contact1': userData.contactNo1 ?? 00,
        'contact2': userData.contactNo2 ?? 00,
        'role': userData.role ?? 'User',
        'identityNo': userData.identityNo ?? 00,
      },
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print('Response data: $responseData');

      if (responseData != null && responseData['success'] == true) {
        return true; // Registration successful
      } else {
        throw Exception(responseData['error'] ?? 'Unknown error'); // Registration failed

      }
    } else {
      throw Exception('Failed to register user'); // HTTP request failed
    }
  } catch (e) {
    print('Error: $e'); // Handle error here
    return false;
  }
}



}
