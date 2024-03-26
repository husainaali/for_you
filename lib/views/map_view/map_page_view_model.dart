import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

import '../../constants/strings.dart';
import '../../models/employee.dart';
import '../../models/user.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../services/user_service.dart';
import '../../view_models/base_model.dart';

class MapPageViewModel extends BaseModel {
  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();
  final UserService userService = locator.get<UserService>();
  bool isEmployeeActive = true;
  User userInformation = User();
  User? userData;
  final ReactiveValue<List<Employee>> _employee = ReactiveValue([]);

  List<Map<String, double>> shipmentsPointsList = [
    {'latitude': 26.024728, 'longitude': 50.567942},
    {'latitude': 26.142828, 'longitude': 50.500422},
    {'latitude': 26.145705, 'longitude': 50.587855},
    {'latitude': 26.220469, 'longitude': 50.532351},
    {'latitude': 26.220942, 'longitude': 50.531791}
  ];

    List<Map<String, double>> shipmentsOfficesList = [
    {'latitude': 26.179498, 'longitude': 50.526057},
    {'latitude': 26.206403, 'longitude': 50.55215 },
    {'latitude': 26.188125, 'longitude': 50.479823},
    {'latitude': 26.157005, 'longitude': 50.525485},
    {'latitude': 26.128547, 'longitude': 50.516558}
  ];

  List<Employee>? get employee => _employee.value;
  List<int> selectedEmployeeList = [];
  List<Marker> markers = [];

  initialize() async {
    setBusy(true);
    var tempUserData =
        await _sharedPreferenceService.getStringData(AppString.userData);
    Map<String, dynamic> userInfo = json.decode(tempUserData);
    userData = User.fromJson(userInfo);

    await userService.getEmployees(userData!.userId).whenComplete(() {
      _employee.value = userService.employee!.toList();
      notifyListeners();
    });
    setBusy(false);
  }

  Future<void> handleTap(LatLng latLng, context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Data'),
          content: Text('Do you want to add data at this location?'),
          actions: <Widget>[
            FilledButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FilledButton(
              child: Text('Add'),
              onPressed: () {
                addMarker(latLng);
                Navigator.of(context).pop();
                // Here you can handle data recording or any other action you want to take
              },
            ),
          ],
        );
      },
    );
  }

  void addMarker(LatLng latLng) {
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: latLng,
        child: Icon(
          Icons.pin_drop,
          color: Colors.red,
        ),
      ),
    );
  }

  selectedEmployee(int? employeeId) {
    print(employeeId);
    if (selectedEmployeeList.contains(employeeId)) {
      selectedEmployeeList.remove(employeeId);
    } else {
      selectedEmployeeList.add(employeeId!);
    }
    notifyListeners();
  }
}
