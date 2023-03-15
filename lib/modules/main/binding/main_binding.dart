import 'package:flutter_demo/modules/home/controller/home_controller.dart';
import 'package:flutter_demo/modules/main/controllers/main_controller.dart';
import 'package:flutter_demo/modules/other/controller/other_controller.dart';
import 'package:flutter_demo/modules/setting/controller/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<OtherController>(
      () => OtherController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );

    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
