part of 'constants_helper.dart';

class AppConfig {
  static const operationMode = OperationModes.production;

  static const productionUrl = 'https://foryou-app.online/';
  static const testUrl = '';

  static const appVersion = "";

  static String get appBaseUrl {
    return operationMode == OperationModes.production ? productionUrl : testUrl;
  }

  static const getUserData = "userlogin.php";
  static const registerUserData = "user_register.php";
  static const newRegister = "new_register.php";
  static const registerManagerData = "manager_register.php";
  
  static const getCountriesCitiesData = "get_countries_cities.php";
  static const getShipmentMethod = "get_shipment_method.php";
  static const getAddresses = "get_my_address.php";
  static const addUpdateAddress = "manage_address.php";


}
