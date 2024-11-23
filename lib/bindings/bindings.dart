import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/controller/api_controller.dart';
import 'package:pas1_mobile_11pplg2_23/controller/database_controller.dart';
import 'package:pas1_mobile_11pplg2_23/controller/login_controller.dart';
import 'package:pas1_mobile_11pplg2_23/controller/navigation_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => DatabaseController());
    Get.lazyPut(() => NavigationController());
  }
}