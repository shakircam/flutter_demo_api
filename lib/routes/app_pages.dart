import 'package:flutter_demo/modules/home/binding/home_binding.dart';
import 'package:flutter_demo/modules/home/views/home_page.dart';
import 'package:flutter_demo/modules/main/binding/main_binding.dart';
import 'package:flutter_demo/modules/main/views/main_screen.dart';
import 'package:flutter_demo/modules/other/binding/information_details_binding.dart';
import 'package:flutter_demo/modules/other/binding/information_list_binding.dart';
import 'package:flutter_demo/modules/other/binding/other_binding.dart';
import 'package:flutter_demo/modules/other/views/details_info.dart';
import 'package:flutter_demo/modules/other/views/information_list.dart';
import 'package:flutter_demo/modules/other/views/other_page.dart';
import 'package:flutter_demo/modules/setting/binding/setting_binding.dart';
import 'package:flutter_demo/modules/setting/views/setting_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => OtherPage(),
      binding: OtherBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION_LIST,
      page: () => InformationList(),
      transition: Transition.leftToRight,
      binding: InformationListBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION_DETAILS,
      page: () => InformationDetails(),
      binding: InformationDetailsBinding(),
    ),
  ];
}
