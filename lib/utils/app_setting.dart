import 'package:lq_common_utils/common_utils.dart';
import 'package:flutter/material.dart';

abstract class _SettingKey {
  static const String isDark = "isDark";
  static const String colorIndex = "colorIndex";
  static const String fontIndex = "fontIndex";
  static const String langIndex = "langIndex";
}

abstract class AppSetting {
  static bool get isDark =>
      SPUtils.getBool(_SettingKey.isDark, defValue: false);

  static set isDark(bool isDark) => SPUtils.putBool(_SettingKey.isDark, isDark);

  static Brightness get brightness =>
      isDark ? Brightness.dark : Brightness.light;

  static int get colorIndex =>
      SPUtils.getInt(_SettingKey.colorIndex, defValue: 0);

  static set colorIndex(int index) =>
      SPUtils.putInt(_SettingKey.colorIndex, index);

  static int get fontIndex =>
      SPUtils.getInt(_SettingKey.fontIndex, defValue: 0);

  static set fontIndex(int index) =>
      SPUtils.putInt(_SettingKey.fontIndex, index);

  static int get langIndex =>
      SPUtils.getInt(_SettingKey.langIndex, defValue: 0);

  static set langIndex(int index) =>
      SPUtils.putInt(_SettingKey.langIndex, index);
}
