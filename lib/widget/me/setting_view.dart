import 'package:flutter/material.dart';
import 'package:fun_flutter/global/expand_list_title.dart';
import 'package:fun_flutter/global/list_title_item.dart';
import 'package:fun_flutter/utils/theme_manager.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("setting".tr)),
        body: GetBuilder<SettingLogic>(builder: (logic) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // ListTitleItem(
                //     title: "clear_cache".tr, icon: Icons.cached, onTap: () {}),
                ExpandListTitle(
                  isExpand: logic.isShowFont,
                  title: "font".tr,
                  icon: Icons.font_download_outlined,
                  expandWidget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile<int>(
                          value: 0,
                          groupValue: logic.fontIndex,
                          title: Text("system".tr,
                              style: ThemeManager.style(fontSize: 13)),
                          onChanged: (value) {
                            logic.updateFont(value!);
                          }),
                      RadioListTile<int>(
                          value: 1,
                          groupValue: logic.fontIndex,
                          title: Text("Lobster",
                              style: ThemeManager.style(fontSize: 13)),
                          onChanged: (value) {
                            logic.updateFont(value!);
                          }),
                      RadioListTile<int>(
                          value: 2,
                          groupValue: logic.fontIndex,
                          title: Text("Pacifico",
                              style: ThemeManager.style(fontSize: 13)),
                          onChanged: (value) {
                            logic.updateFont(value!);
                          }),
                    ],
                  ),
                  onTap: () {
                    logic.showFont();
                  },
                ),
                ExpandListTitle(
                  isExpand: logic.isShowLanguage,
                  title: "language".tr,
                  icon: Icons.language,
                  expandWidget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile<int>(
                          value: 0,
                          groupValue: logic.langIndex,
                          title: Text("system".tr,
                              style: ThemeManager.style(fontSize: 13)),
                          onChanged: (value) {
                            logic.updateLang(value!);
                          }),
                      RadioListTile<int>(
                          value: 1,
                          groupValue: logic.langIndex,
                          title: Text(
                            "zh".tr,
                            style: ThemeManager.style(fontSize: 13),
                          ),
                          onChanged: (value) {
                            logic.updateLang(value!);
                          }),
                      RadioListTile<int>(
                          value: 2,
                          groupValue: logic.langIndex,
                          title: Text("english".tr,
                              style: ThemeManager.style(fontSize: 13)),
                          onChanged: (value) {
                            logic.updateLang(value!);
                          }),
                    ],
                  ),
                  onTap: () {
                    logic.showLanguage();
                  },
                ),
                ListTitleItem(
                    title: "score".tr,
                    icon: Icons.star,
                    onTap: () {
                      LaunchReview.launch(
                          androidAppId: "cn.phoenixsky.funandroid",
                          iOSAppId: "1477299503");
                    }),
                ListTitleItem(
                    title: "feedback".tr,
                    icon: Icons.feedback,
                    onTap: () async {
                      const url = 'mailto:1083099465@qq.com';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    }),
              ],
            ),
          );
        }));
  }
}
