// controllers/post_controller.dart
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/api_service/api_service.dart';
import 'package:pas1_mobile_11pplg2_23/model/api_model.dart';

class ApiController extends GetxController {
  var isLoading = true.obs;
  var apiList = <ApiModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchApi();
      apiList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}