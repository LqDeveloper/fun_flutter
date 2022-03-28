import 'package:fun_flutter/reponse/category.dart';
import 'package:get/get.dart';

class CategoryDetailLogic extends GetxController {
  final Category category = Get.arguments["category"];
  int index = Get.arguments["index"];

  @override
  void onReady() {
    super.onReady();
  }
}
