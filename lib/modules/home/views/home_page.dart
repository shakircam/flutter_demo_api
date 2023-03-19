import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../controller/home_controller.dart';
import '../widget/item_brand.dart';

class HomePage extends BaseView<HomeController> {
  HomePage() {
    Get.put(HomeController());
    controller.getBrandList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Home Getx',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: Obx(
        () => ListView.builder(
            itemCount: controller.brandList.length,
            itemBuilder: (context, index) =>
                ItemBrand(dataModel: controller.brandList[index])),
      ),
    );
  }
}
