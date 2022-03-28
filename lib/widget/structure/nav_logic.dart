import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fun_flutter/reponse/category.dart';
import 'package:fun_flutter/reponse/nav_model.dart';
import 'package:fun_flutter/utils/app_request.dart';
import 'package:get/get.dart';

class NavLogic extends GetxController {
  List<NavModel> categories = [];

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  loadData() async {
    EasyLoading.show();
    try {
      categories = await AppRequest.getNavCategory();
    } on DioError catch (_) {}
    EasyLoading.dismiss();
    update();
  }
}
