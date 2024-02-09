import 'base_model.dart';

class WrapperViewModel extends BaseModel {
  late bool _loggedIn;
  bool get loggedIn => _loggedIn;

  List<String> messages = ["1"];
  void initialize() async {
    setBusy(true);
    _loggedIn = true;
    setBusy(false);
    notifyListeners();
  }
}