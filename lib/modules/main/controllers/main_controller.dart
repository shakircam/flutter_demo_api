
import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../model/menu_code.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }
}