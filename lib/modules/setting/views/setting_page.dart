import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/values/app_values.dart';
import 'package:flutter_demo/core/widget/custom_app_bar.dart';
import 'package:flutter_demo/modules/setting/controller/setting_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends BaseView<SettingController> {
  SettingsPage() {
    Get.put(SettingController());
    //controller.getLoginInfo();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Setting',
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0, // Set the elevation to 8.0
            ),
            onPressed: () {
              controller.increment();
              controller.deleteAllData();
            },
            child: const Text("Logout"),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.loginInfo?.userEmail != null
                  ? 'Email: ${controller.loginInfo?.userEmail}'
                  : "User not login"),
              const SizedBox(
                height: 10,
              ),
              Text('Password: ${controller.loginInfo?.password ?? ""}'),
              Text('Number: ${controller.count}')
            ],
          )),
    );
  }
}
