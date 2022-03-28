import 'package:flutter/material.dart';
import 'package:fun_flutter/widget/structure/nav_category_list.dart';
import 'package:fun_flutter/widget/structure/structure_category_list.dart';
import 'package:get/get.dart';

class StructurePage extends StatefulWidget {
  const StructurePage({Key? key}) : super(key: key);

  @override
  State<StructurePage> createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<String> get _titles => ["type".tr, "nav".tr];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _titles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: List.generate(
              _titles.length,
              (index) => Tab(
                    text: _titles[index],
                  )),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [StructureCategoryList(), NavCategoryList()],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
