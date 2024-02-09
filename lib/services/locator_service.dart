import 'package:get_it/get_it.dart';

import 'api_service.dart';
import 'oauth_service.dart';
import 'user_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  // locator.registerLazySingleton<NameService>(() => NameService());
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<OAuthService>(() => OAuthService());
  locator.registerLazySingleton<UserService>(() => UserService());

  // Register models
  // locator.registerSingleton<NameViewModel>(NameViewModel());
}
