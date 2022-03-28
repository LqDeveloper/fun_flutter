import 'package:flutter/material.dart';
import 'package:fun_flutter/global/article_item.dart';
import 'package:fun_flutter/global/article_placeholder.dart';
import 'package:fun_flutter/global/placeholder_sliver_list.dart';
import 'package:fun_flutter/reponse/article.dart';
import 'package:lq_common_utils/common_utils.dart';
typedef ClickArticle = void Function(int index, Article article);

class ArticleList extends StatelessWidget {
  final LoadingStatus status;
  final List<Article> articles;
  final bool isTop;
  final ClickArticle? onTap;

  const ArticleList(
      {Key? key,
      required this.status,
      required this.articles,
      this.isTop = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlaceholderSliverList(
      status: status,
      builder: (cxt, index) {
        return ArticleItem(
          article: articles[index],
          onTap: onTap != null ? () => onTap!(index,articles[index]) : null,
          isTop: isTop,
        );
      },
      childCount: articles.length,
      loadingCount: 10,
      loadingBuilder: (cxt, index) {
        return const ArticlePlaceholder();
      },
    );
  }
}

