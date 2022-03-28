import 'package:flutter/material.dart';
import 'package:fun_flutter/global/fun_webview.dart';
import 'package:fun_flutter/global/base_page.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/widget/home/article_list.dart';
import 'package:fun_flutter/widget/home/banner_widget.dart';
import 'package:fun_flutter/widget/home/home_logic.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../global/custom_animated_scale.dart';

class HomePage extends BasePage<HomeLogic> {
  HomePage({Key? key}) : super(key: key, controller: HomeLogic());

  @override
  Widget build(BuildContext context, HomeLogic controller) {
    return GetBuilder<HomeLogic>(builder: (controller) {
      return SmartRefresher(
        physics: controller.shouldScroll
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        enablePullUp: true,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              title: CustomAnimatedScale(
                scale: controller.scale,
                child: const Text("Flutter"),
              ),
              centerTitle: true,
              pinned: true,
              expandedHeight: HomeLogic.bannerHeight,
              actions: [
                CustomAnimatedScale(
                    scale: controller.scale,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)))
              ],
              flexibleSpace: const FlexibleSpaceBar(
                background: BannerWidget(),
              ),
            ),
            ArticleList(
              isTop: true,
              articles: controller.topArticles,
              status: controller.topArticleStatus,
              onTap: (index, article) {
                Get.toNamed(RoutePath.webView,
                    arguments: WebArguments(article.id, article.title,
                        article.link, article.collect));
              },
            ),
            ArticleList(
              articles: controller.articles,
              status: controller.articleStatus,
              onTap: (index, article) {
                Get.toNamed(RoutePath.webView,
                    arguments: WebArguments(article.id, article.title,
                        article.link, article.collect));
              },
            )
          ],
        ),
      );
    });
  }
}
