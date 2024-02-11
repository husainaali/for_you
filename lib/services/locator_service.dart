import 'package:get_it/get_it.dart';

import '../views/wrapper_view/wrapper_view_model.dart';
import 'api_service.dart';
import 'user_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  // locator.registerLazySingleton<NameService>(() => NameService());
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<WrapperViewModel>(() => WrapperViewModel());

  // Register models
  // locator.registerSingleton<NameViewModel>(NameViewModel());
}
