import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_flutter/global/base_page.dart';
import 'package:fun_flutter/global/expand_list_title.dart';
import 'package:fun_flutter/global/list_title_item.dart';
import 'package:fun_flutter/utils/alert_utils.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/widget/me/custom_header.dart';
import 'package:get/get.dart';

import 'me_logic.dart';

class MePage extends BasePage<MeLogic> {
  MePage({Key? key}) : super(key: key, controller: MeLogic());

  @override
  Widget build(BuildContext context, MeLogic controller) {
    return GetBuilder<MeLogic>(builder: (logic) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const CustomHeader(),
            ListTitleItem(
              title: "save".tr,
              icon: Icons.favorite_border,
              onTap: () {
                AlertUtils.checkLoginAlert(context, () {});
              },
            ),
            ListTitleItem(
              title: "dark_mode".tr,
              icon: logic.isDark ? Icons.brightness_2 : Icons.brightness_5,
              trailing: CupertinoSwitch(
                value: logic.isDark,
                onChanged: (value) {
                  logic.updateMode(value);
                },
              ),
            ),
            ExpandListTitle(
              isExpand: logic.showColor,
              title: "color".tr,
              icon: Icons.settings,
              expandWidget: ColorSelectorWidget(onTap: (index) {
                logic.changePrimaryColor(index);
              }),
              onTap: () {
                logic.updateShowColor();
              },
            ),
            ListTitleItem(
              title: "setting".tr,
              icon: Icons.color_lens,
              onTap: () {
                Get.toNamed(RoutePath.setting);
              },
            ),
            ListTitleItem(
              title: "update".tr,
              icon: Icons.system_update,
              onTap: () {
                AlertUtils.showUpdateAlert(context);
              },
            ),
          ],
        ),
      );
    });
  }
}

class ColorSelectorWidget extends StatelessWidget {
  final ValueChanged<int> onTap;

  const ColorSelectorWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: Colors.primaries.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 10),
          itemBuilder: (cxt, index) {
            return GestureDetector(
              child: Container(
                color: Colors.primaries[index],
              ),
              onTap: () {
                onTap(index);
              },
            );
          }),
    );
  }
}
