import 'package:get/get.dart';

class IndexLogic extends GetxController {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  bool isLogin = false;

  void updateIndex(int currentIndex) {
    _currentIndex = currentIndex;
    update();
  }
}
