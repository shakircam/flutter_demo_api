import 'package:flutter_demo/data/local/local_preference.dart';
import 'package:flutter_demo/data/local/local_preference_impl.dart';
import 'package:get/get.dart';

class SecureLocalPreferenceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecureLocalPreference>(
      () => SecureLocalPreferenceImpl(),
      tag: (SecureLocalPreference).toString(),
    );
  }
}
