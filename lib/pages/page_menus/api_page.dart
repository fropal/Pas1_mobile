import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/controller/api_controller.dart';
import 'package:pas1_mobile_11pplg2_23/controller/database_controller.dart';
import 'package:pas1_mobile_11pplg2_23/wiget/card_model.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController controller = Get.find();
    final DatabaseController dbController = Get.find();
    dbController.loadSavedApi();

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          title: Text("Home", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: controller.isLoading.value
              ? CircularProgressIndicator()
              : ListView.builder(
              itemCount: controller.apiList.length,
              itemBuilder: (context, index) {
                final team = controller.apiList[index];
                return CardModel(model: team);
              }
          ),
        ),
      );
    });
  }
}
