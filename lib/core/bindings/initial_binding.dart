import 'package:flutter_demo/core/bindings/authentication_repository_binding.dart';
import 'package:flutter_demo/core/bindings/local_preference_binding.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'drug_remote_binding.dart';
import 'drug_repository_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // all repository class
    DrugRepositoryBindings().dependencies();
    AuthenticationRepositoryBindings().dependencies();

    // all local + remote source class
    DrugRemoteSourceBindings().dependencies();
    SecureLocalPreferenceBindings().dependencies();
  }
}
