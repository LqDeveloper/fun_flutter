import 'package:flutter/material.dart';
import 'package:fun_flutter/reponse/category.dart';

class TabAppBar extends StatelessWidget {
  final List<Category> categories;

  const TabAppBar({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: DefaultTabController.of(context),
      tabs: categories.map((e) {
        return Tab(
          text: e.name,
        );
      }).toList(),
    );
  }
}
