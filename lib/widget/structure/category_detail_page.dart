import 'package:flutter/material.dart';
import 'package:fun_flutter/global/tab_body_view.dart';
import 'package:fun_flutter/widget/structure/category_detail_logic.dart';
import 'package:get/get.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({Key? key}) : super(key: key);

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<CategoryDetailLogic>(builder: (logic) {
      return DefaultTabController(
        length: logic.category.children.length,
        initialIndex: logic.index,
        child: Scaffold(
          appBar: AppBar(
            title: Text(logic.category.name),
            bottom: TabBar(
              isScrollable: true,
              controller: DefaultTabController.of(context),
              tabs: logic.category.children.map((e) {
                return Tab(
                  text: e.name,
                );
              }).toList(),
            ),
          ),
          body: TabBodyView(categories: logic.category.children),
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
