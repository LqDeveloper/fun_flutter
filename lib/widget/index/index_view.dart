import 'package:flutter/material.dart';
import 'package:fun_flutter/widget/home/home_view.dart';
import 'package:fun_flutter/widget/me/me_view.dart';
import 'package:fun_flutter/widget/project/project_view.dart';
import 'package:fun_flutter/widget/structure/structure_view.dart';
import 'package:fun_flutter/widget/wechat/wechat_view.dart';
import 'package:get/get.dart';
import 'package:lq_common_utils/common_utils.dart';

import 'index_logic.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);
  final List<Widget> _pages = [
    HomePage(),
    ProjectPage(),
    WechatPage(),
    const StructurePage(),
    MePage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexLogic>(
      builder: (controller) {
        return BottomNavPage(
            index: controller.currentIndex,
            tabs: [
              TabItem(icon: const Icon(Icons.home), label: "home".tr),
              TabItem(
                  icon: const Icon(Icons.format_list_bulleted),
                  label: "project".tr),
              TabItem(icon: const Icon(Icons.group_work), label: "wechat".tr),
              TabItem(
                  icon: const Icon(Icons.call_split), label: "structure".tr),
              TabItem(icon: const Icon(Icons.insert_emoticon), label: "me".tr),
            ],
            pages: _pages);
      },
    );
  }
}
