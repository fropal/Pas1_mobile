import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/api_service/login_service.dart';
import 'package:pas1_mobile_11pplg2_23/model/login_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginStatus = "".obs;
  var username = "".obs;
  var token = "".obs;

  final LoginService _loginService = LoginService();

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final LoginModel response = await _loginService.login(username, password);
      if (response.status) {
        loginStatus.value = response.message;
        token.value = response.token;
      } else {
        loginStatus.value = response.message;
      }
    } catch (e) {
      loginStatus.value = "Error: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }
}
