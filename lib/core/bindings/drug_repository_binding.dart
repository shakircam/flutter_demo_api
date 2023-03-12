

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../data/repository/brand_repository.dart';
import '../../data/repository/brand_repository_impl.dart';

class DrugRepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrandRepository>(
          () => BrandRepositoryImpl(),
      tag: (BrandRepository).toString(),
    );
  }
}