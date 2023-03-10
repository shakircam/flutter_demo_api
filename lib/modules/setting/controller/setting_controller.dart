import 'package:flutter_demo/core/base/base_controller.dart';
import 'package:flutter_demo/data/repository/authentication/authentication_repository.dart';
import 'package:flutter_demo/modules/setting/model/user_info.dart';
import 'package:get/get.dart';

class SettingController extends BaseController {
  final AuthenticationRepository _repository =
      Get.find(tag: (AuthenticationRepository).toString());

  RxInt count = 0.obs;

  void increment() {
    count.value++;
  }

  final Rx<User?> _loginStateController = Rx<User?>(null);
  User? get loginInfo => _loginStateController.value;

  void getLoginInfo() async {
    User? loginInfo = await _repository.getLoginInfo();
    print("call this method");
    _loginStateController.value = loginInfo;
  }

  final Rx<bool> _isLogin = Rx<bool>(false);
  bool get loginStatus => _isLogin.value;

  void deleteAllData() async {
    bool result = await _repository.deleteAllValue();
    if (result) {
      _isLogin.isTrue;
    } else {
      _isLogin.isFalse;
    }
  }

  void saveUserLoginState(String username, String password) async {
    await _repository.saveLoginInfo(username, password);
  }
}
