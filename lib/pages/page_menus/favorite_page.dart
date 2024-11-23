import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/controller/database_controller.dart';
import 'package:pas1_mobile_11pplg2_23/wiget/card_model.dart';


class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.find();

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Favourites", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: controller.savedApi.isNotEmpty ? ListView.builder(
              itemCount: controller.savedApi.length,
              itemBuilder: (context, index) {
                final team = controller.savedApi[index];
                return CardModel(model: team);
              }
          ) : Text("No favourite team yet."),
        ),
      );
    });
  }
}
