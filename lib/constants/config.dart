part of 'constants_helper.dart';

class AppConfig {
  static const operationMode = OperationModes.test;

  static const productionUrl = '';
  static const testUrl = '';

  static const appVersion = "";

  static String get appBaseUrl {
    return operationMode == OperationModes.production ? productionUrl : testUrl;
  }

  static const getUserData = "";

  static const tenant = "c1fc1632-dc8c-4c24-a4ed-57c57889ba61";
  static const clientId = "786fa619-92af-4adf-8828-1bd284129f93";
  static const redirectUrl = "https://login.microsoftonline.com/common/oauth2/nativeclient";
}
