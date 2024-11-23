import 'package:get/get.dart';
class ResponsifController extends GetxController{
  var screenwidth = 0.0.obs;

  void updateScreenwidth(double width){
    screenwidth.value = width;
  }


  bool ismobile() => screenwidth.value <600;
  bool istablet() => screenwidth.value >= 600 && screenwidth.value <1200;
}