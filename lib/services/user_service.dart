
import 'package:for_you/services/api_service.dart';
import 'package:for_you/services/locator_service.dart';

import '../constants/constants_helper.dart';

class UserService {
  ApiService apiService = locator.get<ApiService>();

  // Future<Result> getUserData(String id) async {
  //   Result result = Result(status: false, data: {});
  //   try {
  //     Response response = await apiService.drdGetData(AppConfig.getUserData);
  //     if (response.statusCode == 200) {
  //       result = Result(status: true, data: json.decode(response.body));
  //     }
  //     return result;
  //   } catch (e) {
  //     return result;
  //   }
  // }
}
