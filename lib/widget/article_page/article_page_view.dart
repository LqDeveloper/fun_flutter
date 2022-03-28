import 'package:fun_flutter/global/fun_webview.dart';
import 'package:fun_flutter/global/article_item.dart';
import 'package:fun_flutter/global/article_placeholder.dart';
import 'package:fun_flutter/reponse/article.dart';
import 'package:fun_flutter/reponse/category.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/widget/article_page/article_page_logic.dart';
import 'package:get/get.dart';
import 'package:lq_common_utils/common_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  final Category category;

  const ArticlePage({Key? key, required this.category}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticleState();
}

class _ArticleState extends State<ArticlePage>
    with AutomaticKeepAliveClientMixin {
  late ArticlePageLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(ArticlePageLogic(widget.category),
        tag: widget.category.id.toString());
  }

  @override
  void dispose() {
    Get.delete<ArticlePageLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<ArticlePageLogic>(
        tag: widget.category.id.toString(),
        builder: (logic) {
          switch (logic.status) {
            case LoadingStatus.loading:
              return const _DefaultLoading();
            case LoadingStatus.error:
              return const _DefaultError();
            case LoadingStatus.completed:
              return SmartRefresher(
                onRefresh: logic.onRefresh,
                onLoading: logic.onLoading,
                enablePullUp: true,
                controller: logic.refreshController,
                child: ListView.builder(
                    itemCount: logic.articles.length,
                    itemBuilder: (cxt, index) {
                      Article article = logic.articles[index];
                      return ArticleItem(
                        article: article,
                        onTap: () {
                          Get.toNamed(RoutePath.webView,
                              arguments: WebArguments(article.id, article.title,
                                  article.link, article.collect));
                        },
                      );
                    }),
              );
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class _DefaultLoading extends StatelessWidget {
  const _DefaultLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: ListView.builder(
          itemBuilder: (_, index) {
            return const ArticlePlaceholder();
          },
          physics: const NeverScrollableScrollPhysics(),
        ),
        baseColor: Colors.grey,
        highlightColor: Colors.white);
  }
}

class _DefaultError extends StatelessWidget {
  const _DefaultError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error,
        size: 100,
      ),
    );
  }
}
