import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/controller/login_controller.dart';

class ProfilePage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("My Account", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)
                    ),
                    color: Colors.blueAccent
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "lib/assets/avatar.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Text(controller.username.value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0), textAlign: TextAlign.center),
                      SizedBox(height: 30.0,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/login");
                  },
                  child: Text("Log Out", style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
