import 'package:get/get.dart';

class ApiModel {
  final String strName, strDesc, strLocation, urlBadge;
  RxBool isSaved = false.obs;

  ApiModel({required this.strName, required this.strDesc, required this.strLocation, required this.urlBadge});

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
        strName: json["strTeam"],
        strDesc: json["strDescriptionEN"],
        strLocation: json["strLocation"],
        urlBadge: json["strBadge"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "strTeam": strName,
      "strDescriptionEN": strDesc,
      "strLocation": strLocation,
      "strBadge": urlBadge
    };
  }
}