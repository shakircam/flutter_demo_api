

import 'package:get/get_instance/src/bindings_interface.dart';

import 'drug_remote_binding.dart';
import 'drug_repository_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    DrugRepositoryBindings().dependencies();
    DrugRemoteSourceBindings().dependencies();

  }
}