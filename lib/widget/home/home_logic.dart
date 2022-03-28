import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_flutter/reponse/article.dart';
import 'package:fun_flutter/reponse/banner_model.dart';
import 'package:fun_flutter/utils/app_request.dart';
import 'package:get/get.dart';
import 'package:lq_common_utils/common_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeLogic extends GetxController {
  static const banner = "banner";

  late RefreshController refreshController;
  late ScrollController scrollController;
  LoadingStatus bannerStatus = LoadingStatus.loading;
  LoadingStatus topArticleStatus = LoadingStatus.loading;
  LoadingStatus articleStatus = LoadingStatus.loading;

  double scale = 0.0;
  static final double bannerHeight = ScreenInfo.width * 6 / 11;
  List<BannerModel> banners = [];
  List<Article> topArticles = [];
  List<Article> articles = [];

  bool get shouldScroll => articles.isNotEmpty || topArticles.isNotEmpty;
  var _pageNum = 0;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController();
    scrollController = ScrollController();
    scrollController.addListener(() {
      double offset = scrollController.offset;
      if (offset > HomeLogic.bannerHeight - ScreenInfo.appBarHeight &&
          scale == 0) {
        scale = 1;
        update();
      } else if (offset <= HomeLogic.bannerHeight - ScreenInfo.appBarHeight &&
          scale == 1) {
        scale = 0;
        update();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    _getBannerData();
    onRefresh();
  }

  @override
  void onClose() {
    super.onClose();
    refreshController.dispose();
    scrollController.dispose();
  }

  void onRefresh() async {
    _pageNum = 0;
    try {
      topArticles = await AppRequest.getTopArticles();
      topArticleStatus = LoadingStatus.completed;
    } on DioError catch (_) {
      topArticleStatus = LoadingStatus.error;
    }

    try {
      articles = await AppRequest.getArticles(_pageNum);
      articleStatus = LoadingStatus.completed;
    } on DioError catch (_) {
      articleStatus = LoadingStatus.error;
    }
    update();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    _pageNum++;
    try {
      var list = await AppRequest.getArticles(_pageNum);
      articles.addAll(list);
      articleStatus = LoadingStatus.completed;
    } on DioError catch (_) {
      articleStatus = LoadingStatus.error;
    }
    update();
    refreshController.loadComplete();
  }

  void _getBannerData() async {
    try {
      banners = await AppRequest.getBanners();
      bannerStatus = LoadingStatus.completed;
    } on DioError catch (e) {
      bannerStatus = LoadingStatus.error;
    }
    update([HomeLogic.banner]);
  }
}
