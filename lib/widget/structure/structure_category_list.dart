import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fun_flutter/global/base_page.dart';
import 'package:fun_flutter/reponse/category.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/widget/structure/structure_logic.dart';
import 'package:fun_flutter/widget/structure/wrap_list_item.dart';
import 'package:get/get.dart';

class StructureCategoryList extends BasePage<StructureLogic> {
  StructureCategoryList({Key? key})
      : super(key: key, controller: StructureLogic());

  @override
  Widget build(BuildContext context, StructureLogic controller) {
    return GetBuilder<StructureLogic>(builder: (logic) {
      return ListView.builder(
          itemCount: logic.categories.length,
          itemBuilder: (cxt, index) {
            return WrapListItem(
              index: index,
              onTap: (index, childIndex) {
                Category category = logic.categories[index];
                Get.toNamed(RoutePath.detailCategory,
                    arguments: {"category": category, "index": childIndex});
              },
              title: logic.categories[index].name,
              children:
                  logic.categories[index].children.map((e) => e.name).toList(),
            );
          });
    });
  }
}
