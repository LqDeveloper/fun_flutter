import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_flutter/global/fun_webview.dart';
import 'package:fun_flutter/reponse/banner_model.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/widget/home/home_logic.dart';
import 'package:get/get.dart';
import 'package:lq_common_utils/common_utils.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
        id: HomeLogic.banner,
        builder: (controller) {
          return Container(
            color: Colors.white,
            child: LoadingStatusWidget(
              builder: (cxt) {
                return Swiper.builder(
                  childCount: controller.banners.length,
                  indicator: CircleSwiperIndicator(itemColor: Colors.grey),
                  onTap: (index) {
                    BannerModel model = controller.banners[index];
                    Get.toNamed(RoutePath.webView,
                        arguments: WebArguments(
                            model.id, model.title, model.url, false));
                  },
                  itemBuilder: (_, index) {
                    return CachedNetworkImage(
                      imageUrl: controller.banners[index].imagePath,
                      fit: BoxFit.fill,
                    );
                  },
                );
              },
              status: controller.bannerStatus,
              loading: (cxt) {
                return Container(
                    color: Colors.white,
                    child: const CupertinoActivityIndicator());
              },
            ),
          );
        });
  }
}
