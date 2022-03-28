import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fun_flutter/reponse/article.dart';
import 'package:fun_flutter/utils/alert_utils.dart';
import 'package:fun_flutter/utils/theme_manager.dart';
import 'package:get/get.dart';

class ArticleItem extends StatelessWidget {
  final bool isTop;
  final Article article;
  final VoidCallback? onTap;

  const ArticleItem(
      {Key? key, required this.article, this.onTap, this.isTop = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black26, width: 0.7),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //********
              Row(
                children: [
                  ClipOval(
                      child: CachedNetworkImage(
                    imageUrl: "http://placeimg.com/20/20",
                    fit: BoxFit.fill,
                    width: 20,
                    height: 20,
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    article.author,
                    style: ThemeManager.style(fontSize: 12),
                  ),
                  const Spacer(),
                  Text(
                    article.niceDate,
                    style: ThemeManager.style(fontSize: 12),
                  ),
                ],
              ),
              //********
              const SizedBox(height: 5),
              if (article.envelopePic.isEmpty)
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      article.title,
                    )),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.title),
                          const SizedBox(height: 2),
                          Text(
                            article.desc,
                            style: ThemeManager.style(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: article.envelopePic,
                      width: 60,
                      height: 60,
                    )
                  ],
                ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isTop)
                    Text(
                      "top".tr,
                      style: const TextStyle(fontSize: 8),
                    ),
                  if (isTop) const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      article.superChapterName + ' · ' + article.chapterName,
                      style: ThemeManager.style(fontSize: 10),
                    ),
                  ),
                  FavoriteIcon(
                    article: article,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  final Article article;

  const FavoriteIcon({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AlertUtils.checkLoginAlert(context, () {

        });
      },
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        child: Icon(article.collect ? Icons.favorite : Icons.favorite_border,
            color: Colors.redAccent[100]),
      ),
    );
  }
}
