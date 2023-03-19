
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/main/views/main_screen.dart';
import 'package:get/get.dart';
import 'core/bindings/initial_binding.dart';
import 'routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  receive();
  runApp( const MyApp());
}

void receive()async{
  // Check if you received the link via `getInitialLink` first
  final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();

  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    print("dynamic link terminated app $deepLink");
    // Example of using the dynamic link to push the user to a different screen

    final prefix = "shakircam.page.link/";
    if (deepLink.toString().startsWith(prefix)) {
      final suffix = deepLink.toString().substring(prefix.length);
      if (suffix == "setting") {
        // navigate to the setting page
        Get.toNamed(Routes.SETTINGS);
      } else {
         var id = deepLink.queryParameters['id'];
          print("dynamic link terminated app receive id $id");
        Get.toNamed(Routes.INFORMATION_LIST);
      }
    }

  }

  FirebaseDynamicLinks.instance.onLink.listen(
        (pendingDynamicLinkData) {
      // Set up the `onLink` event listener next as it may be received here
      if (pendingDynamicLinkData != null) {
        final Uri deepLink = pendingDynamicLinkData.link;

      }
    },
  );
}


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


