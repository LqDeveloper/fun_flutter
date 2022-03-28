import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fun_flutter/global/pull_refresh_config.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/utils/app_translation.dart';
import 'package:fun_flutter/utils/theme_manager.dart';
import 'package:get/get.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PullRefreshConfig(child: App());
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: AppTranslation.initLocal,
      fallbackLocale: const Locale("zh", "CN"),
      theme: ThemeManager.initThemeData,
      builder: EasyLoading.init(),
      defaultTransition: Transition.cupertino,
      initialRoute: RoutePath.index,
      getPages: AppRoute.pages,
      unknownRoute: AppRoute.unknownPage,
    );
  }
}
