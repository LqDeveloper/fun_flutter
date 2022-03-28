import 'package:flutter/material.dart';
import 'package:fun_flutter/global/fun_webview.dart';

import 'package:fun_flutter/widget/index/index_binding.dart';
import 'package:fun_flutter/widget/index/index_view.dart';
import 'package:fun_flutter/widget/me/login_binding.dart';
import 'package:fun_flutter/widget/me/login_view.dart';
import 'package:fun_flutter/widget/me/register_binding.dart';
import 'package:fun_flutter/widget/me/register_logic.dart';
import 'package:fun_flutter/widget/me/register_view.dart';
import 'package:fun_flutter/widget/me/setting_binding.dart';
import 'package:fun_flutter/widget/me/setting_view.dart';
import 'package:fun_flutter/widget/structure/category_detail_binding.dart';
import 'package:fun_flutter/widget/structure/category_detail_page.dart';
import 'package:get/get.dart';

abstract class RoutePath {
  static const index = "/index";
  static const unknown = "/unknown";
  static const webView = "/webView";
  static const detailCategory = "/detailCategory";
  static const setting = "/setting";
  static const login = "/login";
  static const register = "/register";
}

class AppRoute {
  static List<GetPage> pages = [
    GetPage(
        name: RoutePath.index,
        page: () => IndexPage(),
        bindings: [IndexBinding()]),
    GetPage(name: RoutePath.webView, page: () => const FunWebView()),
    GetPage(
        name: RoutePath.detailCategory,
        page: () => const CategoryDetailPage(),
        binding: CategoryDetailBinding()),
    GetPage(
        name: RoutePath.setting,
        page: () => const SettingPage(),
        binding: SettingBinding()),
    GetPage(
        name: RoutePath.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: RoutePath.register,
        page: () => const RegisterPage(),
        binding: RegisterBinding())
  ];
  static GetPage unknownPage =
      GetPage(name: RoutePath.unknown, page: () => const UnKnownPage());
}

class UnKnownPage extends StatelessWidget {
  const UnKnownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("未知路由"),
      ),
      body: const Center(
        child: Text("当前路由未注册"),
      ),
    );
  }
}
