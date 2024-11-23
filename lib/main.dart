import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/pages/bottom_nav.dart';
import 'package:pas1_mobile_11pplg2_23/pages/page_menus/api_page.dart';
import 'bindings/bindings.dart';
import 'package:pas1_mobile_11pplg2_23/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      initialBinding: MyBindings(),
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/dashboard', page: () => BottomNav()),
      ],
    );
  }
}
