import 'package:flutter/material.dart';
import 'package:fun_flutter/global/fun_webview.dart';
import 'package:fun_flutter/global/base_page.dart';
import 'package:fun_flutter/reponse/nav_model.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/widget/structure/nav_logic.dart';
import 'package:fun_flutter/widget/structure/wrap_list_item.dart';
import 'package:get/get.dart';

class NavCategoryList extends BasePage<NavLogic> {
  NavCategoryList({Key? key}) : super(key: key, controller: NavLogic());

  @override
  Widget build(BuildContext context, NavLogic controller) {
    return GetBuilder<NavLogic>(builder: (logic) {
      return ListView.builder(
          itemCount: logic.categories.length,
          itemBuilder: (cxt, index) {
            return WrapListItem(
                index: index,
                onTap: (index, childIndex) {
                  NavArticle article =
                      logic.categories[index].articles[childIndex];
                  Get.toNamed(RoutePath.webView,
                      arguments: WebArguments(article.id, article.title,
                          article.link, article.collect));
                },
                title: logic.categories[index].name,
                children: logic.categories[index].articles
                    .map((e) => e.title)
                    .toList());
          });
    });
  }
}
