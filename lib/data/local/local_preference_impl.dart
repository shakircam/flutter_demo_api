import 'package:flutter_demo/modules/setting/model/user_info.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_preference.dart';

class SecureLocalPreferenceImpl implements SecureLocalPreference {
  final storage = const FlutterSecureStorage();

  @override
  Future<void> saveLoginInfo(String username, String password) async {
    await storage.write(key: 'userEmail', value: username);
    await storage.write(key: 'password', value: password);
  }

  @override
  Future<User?> getLoginInfo() async {
    final userEmail = await storage.read(key: 'userEmail');
    final password = await storage.read(key: 'password');
    if (userEmail != null && password != null) {
      var user = User.fromJson({'userEmail': userEmail, 'password': password});

      //User res = User.fromJson({'userEmail': userEmail, 'password': password});
      print("user login info ${user.userEmail}");
      return user;
    } else {
      print("user login info  nul");
      return null;
    }
  }

  @override
  Future<void> setString(String key, value) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<String?> getString(String key) async {
    final result = await storage.read(key: 'userEmail');
    return result ?? "";
  }

  @override
  Future<bool> deleteSingleItem(String key) async {
    try {
      await storage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAllValue() async {
    try {
      await storage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }
}
