import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeMenu(int index) {
    selectedIndex.value = index;
  }
}