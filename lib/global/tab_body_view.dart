import 'package:flutter/material.dart';

import 'package:fun_flutter/reponse/category.dart';
import 'package:fun_flutter/widget/article_page/article_page_view.dart';
class TabBodyView extends StatelessWidget {
  final List<Category> categories;

  const TabBodyView({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: categories.map((e) {
        return ArticlePage(category: e);
      }).toList(),
      controller: DefaultTabController.of(context),
    );
  }
}
