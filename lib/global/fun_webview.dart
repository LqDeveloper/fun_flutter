import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lq_common_utils/common_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebArguments {
  int id;
  String title;
  String link;
  bool collect;

  WebArguments(this.id, this.title, this.link, this.collect);
}

class FunWebView extends StatefulWidget {
  const FunWebView({Key? key}) : super(key: key);

  @override
  State<FunWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<FunWebView> {
  late WebArguments _arguments;

  @override
  void initState() {
    super.initState();
    _arguments = Get.arguments as WebArguments;
  }

  @override
  void dispose() {
    super.dispose();
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_arguments.title),
        actions: [
          IconButton(
              onPressed: () {
                launch(_arguments.link, forceSafariVC: false);
              },
              icon: const Icon(Icons.language)),
          IconButton(
              onPressed: () {
                Share.share(_arguments.title + " " + _arguments.link);
              },
              icon: const Icon(Icons.share)),
        ],
      ),
      body: AppWebView(
        type: WebViewLoadType.url,
        value: _arguments.link,
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
        onPageStarted: (url) {
          EasyLoading.show();
        },
        onPageFinished: (url) {
          EasyLoading.dismiss(animation: true);
        },
      ),
    );
  }
}
