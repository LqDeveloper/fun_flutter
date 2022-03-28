import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fun_flutter/reponse/category.dart';
import 'package:fun_flutter/utils/app_request.dart';
import 'package:get/get.dart';

class StructureLogic extends GetxController {
  List<Category> categories = [];

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  loadData() async {
    EasyLoading.show();
    try {
      categories = await AppRequest.getStructureCategory();
    } on DioError catch (_) {}
    EasyLoading.dismiss();
    update();
  }
}
