import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/controller/database_controller.dart';
import 'package:pas1_mobile_11pplg2_23/model/api_model.dart';
import 'package:pas1_mobile_11pplg2_23/pages/detail_page.dart';

class CardModel extends StatelessWidget {
  final ApiModel model;
  const CardModel({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.find();

    return Obx(() {
      return InkWell(
        onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(model: model))); },
        child: Card(
          margin: EdgeInsets.all(16.0),
          elevation: 5.0,
          child: Column(
            children: [
              // Gambar di atas
              Image.network(
                model.urlBadge,
                height: 250,
                fit: BoxFit.cover,
              ),
              // Konten di bawah gambar
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Detail acara (judul dan waktu)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.strName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            model.strLocation,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    // Tombol favorit
                    IconButton(
                      icon: Icon(
                        model.isSaved.value
                            ? Icons.star
                            : Icons.star_border_outlined,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        if (model.isSaved.value) {
                          model.isSaved.value = false;
                          controller.deleteSavedApi(model);
                        } else {
                          model.isSaved.value = true;
                          controller.saveApi(model);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
