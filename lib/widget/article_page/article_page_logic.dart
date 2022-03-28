import 'package:dio/dio.dart';
import 'package:fun_flutter/reponse/article.dart';
import 'package:fun_flutter/reponse/category.dart';
import 'package:fun_flutter/utils/app_request.dart';
import 'package:get/get.dart';
import 'package:lq_common_utils/common_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticlePageLogic extends GetxController {
  final Category category;

  ArticlePageLogic(this.category);

  late RefreshController refreshController = RefreshController();
  List<Article> articles = [];
  LoadingStatus status = LoadingStatus.loading;
  int _pageNum = 0;

  @override
  void onReady() {
    super.onReady();
    onRefresh();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  void onRefresh() async {
    _pageNum = 0;
    try {
      articles = await AppRequest.getArticles(_pageNum, cid: category.id);
      status = LoadingStatus.completed;
    } on DioError catch (_) {
      status = LoadingStatus.error;
    }
    refreshController.refreshCompleted();
    update();
  }

  void onLoading() async {
    _pageNum++;
    try {
      List<Article> list =
          await AppRequest.getArticles(_pageNum, cid: category.id);
      articles.addAll(list);
    } on DioError catch (_) {}
    refreshController.loadComplete();
    update();
  }
}
