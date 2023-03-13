import 'package:flutter_demo/data/repository/authentication/authentication_repository.dart';
import 'package:flutter_demo/data/repository/authentication/authentication_repository_impl.dart';
import 'package:get/get.dart';

class AuthenticationRepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(),
      tag: (AuthenticationRepository).toString(),
    );
  }
}
