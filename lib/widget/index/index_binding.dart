import 'package:get/get.dart';

import 'index_logic.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IndexLogic());
  }
}
