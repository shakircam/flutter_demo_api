import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/main/views/main_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/bindings/initial_binding.dart';


void main() {
  runApp(const MyApp());
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}


