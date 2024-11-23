import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/controller/login_controller.dart';
import 'package:pas1_mobile_11pplg2_23/wiget/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            SizedBox(height: 100),
            SizedBox(height: 100),
            Center(
              child: Text(
                "Aplikasi login",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
            ),
            MyTextField(
              hintText: 'Password',
              isObscure: true,
              controller: passwordController,
            ),
            SizedBox(height: 16),
            Obx(() => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blueAccent),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Nama dan password harus diisi!",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          } else {
                            await controller.login(usernameController.text,
                                passwordController.text);
                            final message = controller.loginStatus.value;
                            final isSuccess = message == "Login success";
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  message,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                backgroundColor:
                                    isSuccess ? Colors.green : Colors.red,
                              ),
                            );
                            if (isSuccess) {
                              Get.offNamed('/dashboard');
                            }
                          }
                        },
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                )),
          ],
        ),
      ),
    );
  }
}
