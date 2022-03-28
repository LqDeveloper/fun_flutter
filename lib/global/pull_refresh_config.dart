import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullRefreshConfig extends StatelessWidget {
  final Widget child;

  const PullRefreshConfig({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => ClassicHeader(
        releaseText: "releaseText".tr,
        refreshingText: "refreshingText".tr,
        completeText: "completeText".tr,
      ),
      footerBuilder: () => ClassicFooter(
        idleText: "idleText".tr,
        loadingText: "loadingText".tr,
      ),
      enableLoadingWhenNoData: true,
      enableBallisticRefresh: true,
      child: child,
    );
  }
}
