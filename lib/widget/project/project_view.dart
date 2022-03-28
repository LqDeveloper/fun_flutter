import 'package:flutter/material.dart';
import 'package:fun_flutter/global/base_page.dart';
import 'package:fun_flutter/global/tab_app_bar.dart';
import 'package:fun_flutter/global/tab_body_view.dart';
import 'package:get/get.dart';

import 'project_logic.dart';

class ProjectPage extends BasePage<ProjectLogic> {
  ProjectPage({Key? key}) : super(key: key, controller: ProjectLogic());

  @override
  Widget build(BuildContext context, ProjectLogic controller) {
    return GetBuilder<ProjectLogic>(builder: (logic) {
      return DefaultTabController(
        length: logic.categories.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: TabAppBar(categories: logic.categories),
          ),
          body: TabBodyView(categories: logic.categories),
        ),
      );
    });
  }
}
