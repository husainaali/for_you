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
  static const registerManagerData = "manager_register.php";
}
