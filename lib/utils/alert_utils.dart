import 'package:flutter/material.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/widget/index/index_logic.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lq_common_utils/common_utils.dart';

typedef CheckLoginCallback = void Function();

class AlertUtils {
  static Future<void> checkLoginAlert(
      BuildContext context, CheckLoginCallback callback) async {
    if (Get.find<IndexLogic>().isLogin) {
      callback();
    } else {
      bool result = (await context.showMaterialDialog<bool>(builder: (cxt) {
            return AlertDialog(
              title: Text("please_login".tr),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("cancel".tr)),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("ok".tr)),
              ],
            );
          })) ??
          false;
      if (result) {
        Get.toNamed(RoutePath.login);
      }
    }
  }

  static Future showUpdateAlert(BuildContext context) async {
    //通过接口检查是否更新
    context.showMaterialDialog(builder: (cxt) {
      return AlertDialog(
        title: Text("update".tr),
        content: Text("is_latest".tr),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("ok".tr))
        ],
      );
    });
  }
}
