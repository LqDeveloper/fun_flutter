import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fun_flutter/utils/dio_manager.dart';
import 'package:fun_flutter/widget/root_widget.dart';
import 'package:lq_common_utils/common_utils.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await UtilsInit.initUtils();
  await DioManager.initDio();
  runApp(const RootWidget());
  FlutterNativeSplash.remove();
}
