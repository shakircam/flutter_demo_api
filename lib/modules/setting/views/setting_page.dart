import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/values/app_values.dart';
import 'package:flutter_demo/core/widget/custom_app_bar.dart';
import 'package:flutter_demo/modules/home/controller/home_controller.dart';
import 'package:flutter_demo/modules/setting/controller/setting_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../model/user_info.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Setting'),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 elevation: 0.0, // Set the elevation to 8.0
//               ),
//               onPressed: () {
//                 clearLoginState();
//               },
//               child: Text("Logout"),
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: FutureBuilder<User?>(
//           future: getUserLoginState(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               print("user email: ${snapshot.error} ");
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || snapshot.data == null) {
//               return Text('User not logged in');
//             } else {
//               final userEmail = snapshot.data!.userEmail;
//               final password = snapshot.data!.password;
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Email: $userEmail'),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text('Password: $password'),
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Future<User?> getUserLoginState() async {
//     const storage = FlutterSecureStorage();
//     final userEmail = await storage.read(key: 'userEmail');
//     final password = await storage.read(key: 'password');
//     if (userEmail != null && password != null) {
//       print("user email: ${userEmail} password: ${password}");

//       dynamic user =
//           User.fromJson({'userEmail': userEmail, 'password': password});
//       print("user email: ${user.userEmail} password: ${user.password}");
//       return user;
//     } else {
//       return null;
//     }
//   }

//   void clearLoginState() async {
//     const storage = FlutterSecureStorage();
//     await storage.deleteAll();
//   }
// }

class SettingsPage extends BaseView<SettingController> {
  SettingsPage() {
    Get.put(SettingController());
    controller.getLoginInfo();
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
            ],
          )),
    );
  }
}
