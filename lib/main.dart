import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/main/views/main_screen.dart';
import 'package:get/get.dart';
import 'core/bindings/initial_binding.dart';
import 'modules/other/views/details_info.dart';
import 'routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

// void handleDynamicLink() async {
//   final PendingDynamicLinkData? initialLink =
//   await FirebaseDynamicLinks.instance.getInitialLink();
//   if (initialLink != null) {
//     final Uri deepLink = initialLink.link;
//     print("dynamic link terminated app $deepLink");
//     var isSettingPage = deepLink.pathSegments.contains('setting');
//     print("dynamic link terminated app isSettingPage $isSettingPage");
//     print("dynamic link terminated app isDetailsPage ${deepLink.pathSegments.contains('information-details')}");
//     print("dynamic link terminated app isPage ${deepLink.pathSegments.contains('page')}");
//     print("dynamic link terminated app id ${deepLink.queryParameters['id']}");
//
//     if (isSettingPage) {
//       try {
//         print("Dynamic going to SettingPage");
//         Get.toNamed(Routes.SETTINGS);
//       } catch (e) {
//         print("Dynamic link handle error $e");
//       }
//     } else if (deepLink.pathSegments.contains('page')) {
//       try {
//         String? id = deepLink.queryParameters['id'];
//         if(id != null){
//           print("Dynamic going to information-details and id $id");
//           Get.toNamed(Routes.INFORMATION_DETAILS,
//               arguments: {"id":id});
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>  InformationDetails(),
//               // Pass the arguments as part of the RouteSettings. The
//               // DetailScreen reads the arguments from these settings.
//               settings: RouteSettings(
//                 arguments: id,
//               ),
//             ),
//           );
//         }else{
//           print("Dynamic going to information-details id null");
//         }
//       } catch (e) {
//         print("Dynamic link handle error $e");
//       }
//     }
//   }
//   FirebaseDynamicLinks.instance.onLink.listen(
//         (pendingDynamicLinkData) {
//       if (pendingDynamicLinkData != null) {
//         final Uri deepLink = pendingDynamicLinkData.link;
//         var isSettingPage = deepLink.pathSegments.contains('setting');
//         if (isSettingPage) {
//           try {
//             Get.toNamed(Routes.SETTINGS);
//           } catch (e) {
//             print("Dynamic link handle error $e");
//           }
//         } else if (deepLink.pathSegments.contains('information-details')) {
//           try {
//             String? id = deepLink.queryParameters['id'];
//             Get.toNamed(Routes.INFORMATION_DETAILS);
//           } catch (e) {
//             print("Dynamic link handle error $e");
//           }
//         }
//       }
//     },
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}



