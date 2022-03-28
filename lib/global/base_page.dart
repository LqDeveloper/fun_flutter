import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class BasePage<T extends GetxController> extends StatefulWidget {
  final T controller;
  final String? tag;

  const BasePage({Key? key, required this.controller, this.tag})
      : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState<T>();

  Widget build(BuildContext context, T controller);
}

class _BasePageState<T extends GetxController> extends State<BasePage<T>>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    Get.put(widget.controller, tag: widget.tag);
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<T>(tag: widget.tag);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context, widget.controller);
  }

  @override
  bool get wantKeepAlive => true;
}
