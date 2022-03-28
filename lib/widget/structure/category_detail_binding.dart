import 'package:flutter/material.dart';
import 'package:fun_flutter/widget/structure/category_detail_logic.dart';
import 'package:get/get.dart';

class CategoryDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryDetailLogic());
  }
}