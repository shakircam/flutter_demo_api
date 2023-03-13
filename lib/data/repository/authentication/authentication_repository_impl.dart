import 'package:flutter_demo/data/local/local_preference.dart';
import 'package:flutter_demo/data/repository/authentication/authentication_repository.dart';
import 'package:flutter_demo/modules/setting/model/user_info.dart';
import 'package:get/get.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final SecureLocalPreference _localSource =
      Get.find(tag: (SecureLocalPreference).toString());

  @override
  Future<bool> deleteAllValue() {
    return _localSource.deleteAllValue();
  }

  @override
  Future<bool> deleteSingleItem(String key) {
    return _localSource.deleteSingleItem(key);
  }

  @override
  Future<User?> getLoginInfo() {
    return _localSource.getLoginInfo();
  }

  @override
  Future<void> saveLoginInfo(String username, String password) async {
    _localSource.saveLoginInfo(username, password);
  }
}
