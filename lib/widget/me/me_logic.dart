import 'package:flutter/material.dart';
import 'package:fun_flutter/utils/app_setting.dart';
import 'package:fun_flutter/utils/theme_manager.dart';
import 'package:get/get.dart';

class MeLogic extends GetxController {
  bool isDark = AppSetting.isDark;
  bool showColor = false;
  int colorIndex = 0;

  void updateMode(bool isDarkModel) {
    isDark = isDarkModel;
    AppSetting.isDark = isDark;
    ThemeData themeData = ThemeManager.createThemeData(
        Colors.primaries[colorIndex], AppSetting.brightness);
    Get.changeTheme(themeData);
    update();
  }

  void updateShowColor() {
    showColor = !showColor;
    update();
  }

  void changePrimaryColor(int index) {
    colorIndex = index;
    AppSetting.colorIndex = index;
    ThemeData themeData = ThemeManager.createThemeData(
        Colors.primaries[index], AppSetting.brightness);
    ThemeManager.initEasyLoading(Colors.primaries[index]);
    Get.changeTheme(themeData);
  }
}
