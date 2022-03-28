import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app_setting.dart';

class ThemeManager {
  static const fonts = ['PingFang SC', 'Lobster', "Pacifico"];

  static TextStyle style({Color? color, double? fontSize}) {
    return TextStyle(
      fontFamily: fonts[AppSetting.fontIndex],
      color: color,
      fontSize: fontSize,
    );
  }

  static Color bgColor() {
    return AppSetting.isDark ? Colors.white : Colors.black;
  }

  static MaterialColor get primaryColor =>
      Colors.primaries[AppSetting.colorIndex];

  static ThemeData get initThemeData => ThemeManager.createThemeData(
      Colors.primaries[AppSetting.colorIndex], AppSetting.brightness);

  static ThemeData createThemeData(
      MaterialColor primaryColor, Brightness brightness) {
    final fontFamily = fonts[AppSetting.fontIndex];
    ThemeData themeData = ThemeData(
        fontFamily: fontFamily,
        //配置应用程序的主背景色
        primaryColor: primaryColor,
        //用于导航栏，FloatingActionButton的背景色
        primarySwatch: primaryColor,
        //配置应用程序的亮色和暗色
        brightness: brightness,
        //设置输入框光标的颜色
        textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
        //设置输入框样式
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              fontFamily: fontFamily, fontSize: 14, color: Colors.grey),
          errorStyle:
              TextStyle(fontFamily: fontFamily, fontSize: 8, color: Colors.red),
          prefixIconColor: primaryColor,
          suffixIconColor: Colors.grey,
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
        ),
        //设置ListTitle的icon的颜色
        listTileTheme: ListTileThemeData(
          iconColor: primaryColor,
        ),
        //colorScheme介绍 https://material.io/design/color/the-color-system.html#color-theme-creation
        //secondary 浮动操作按钮 选择控件，如滑块和开关 突出显示选定的文本 进度条 链接和标题
        colorScheme: brightness == Brightness.light
            ? ColorScheme.light(
                primary: primaryColor,
                secondary: primaryColor,
                surface: Colors.white,
                background: Colors.white)
            : ColorScheme.dark(
                primary: primaryColor,
                secondary: primaryColor,
                surface: Colors.black45,
                background: Colors.black45),
        //设置分割线的颜色
        dividerTheme: const DividerThemeData(color: Colors.grey),
        //dialog的配置
        dialogTheme: DialogTheme(
            alignment: Alignment.center,
            titleTextStyle: TextStyle(
                fontSize: 18, color: primaryColor, fontFamily: fontFamily),
            contentTextStyle: TextStyle(
                fontSize: 14, color: primaryColor, fontFamily: fontFamily)),
        //Chip的样式
        chipTheme: ChipThemeData.fromDefaults(
            brightness: brightness,
            secondaryColor: primaryColor,
            labelStyle: TextStyle(
                fontSize: 14,
                fontFamily: fontFamily,
                color: brightness == Brightness.light
                    ? Colors.black
                    : Colors.white)),
        //iOS 组件样式设置
        cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
            primaryColor: primaryColor,
            brightness: brightness,
            barBackgroundColor: primaryColor,
            scaffoldBackgroundColor:
                brightness == Brightness.light ? Colors.white : Colors.black45),
        //设置AppBar
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: primaryColor,
            titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w400)),
        //设置tabbar
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily,
              fontSize: 16),
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: fontFamily,
              fontSize: 16),
        ),
        //设置底部导航
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            elevation: 5));
    return themeData;
  }

  static void initEasyLoading(Color primaryColor) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = primaryColor
      ..backgroundColor = Colors.transparent
      ..indicatorColor = primaryColor
      ..textColor = primaryColor
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }
}
