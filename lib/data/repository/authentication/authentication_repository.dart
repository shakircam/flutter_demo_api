import 'package:flutter_demo/modules/setting/model/user_info.dart';

abstract class AuthenticationRepository {
  Future<void> saveLoginInfo(String username, String password);
  Future<User?> getLoginInfo();

  Future<bool> deleteSingleItem(String key);
  Future<bool> deleteAllValue();
}
