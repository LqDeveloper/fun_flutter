import 'package:flutter/material.dart';
import 'package:fun_flutter/utils/app_setting.dart';
import 'package:fun_flutter/utils/app_translation.dart';
import 'package:fun_flutter/utils/theme_manager.dart';
import 'package:get/get.dart';

class SettingLogic extends GetxController {
  bool isShowFont = false;
  int fontIndex = AppSetting.fontIndex;
  bool isShowLanguage = false;
  int langIndex = AppSetting.langIndex;

  void showFont() {
    isShowFont = !isShowFont;
    update();
  }

  void updateFont(int index) {
    fontIndex = index;
    AppSetting.fontIndex = index;
    update();
    ThemeData themeData = ThemeManager.createThemeData(
        Colors.primaries[AppSetting.colorIndex], AppSetting.brightness);
    Get.changeTheme(themeData);
  }

  void showLanguage() {
    isShowLanguage = !isShowLanguage;
    update();
  }

  void updateLang(int index) {
    langIndex = index;
    AppSetting.langIndex = index;
    update();
    Get.updateLocale(AppTranslation.locals[index]);
  }
}
