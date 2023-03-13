import 'package:flutter_demo/modules/setting/model/user_info.dart';

abstract class SecureLocalPreference<T> {
  Future<void> saveLoginInfo(String username, String password);
  Future<User?> getLoginInfo();

  Future<void> setString(String key, T value);
  Future<String?> getString(String key);

  Future<bool> deleteSingleItem(String key);
  Future<bool> deleteAllValue();
}
