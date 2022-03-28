import 'package:flutter/material.dart';
import 'package:lq_common_utils/common_utils.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderSliverList extends StatelessWidget {
  final LoadingStatus status;
  final IndexedWidgetBuilder? loadingBuilder;
  final Widget? error;
  final int childCount;
  final int loadingCount;
  final NullableIndexedWidgetBuilder builder;

  const PlaceholderSliverList(
      {Key? key,
      required this.status,
      required this.childCount,
      required this.builder,
      this.loadingBuilder,
      this.loadingCount = 10,
      this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadingStatus.completed:
        return SliverList(
          delegate: SliverChildBuilderDelegate(builder, childCount: childCount),
        );
      case LoadingStatus.loading:
      case LoadingStatus.error:
        return SliverList(
          delegate: SliverChildBuilderDelegate((cxt, index) {
            return loadingBuilder != null
                ? Shimmer.fromColors(
                    child: loadingBuilder!(cxt, index),
                    baseColor: Colors.grey,
                    highlightColor: Colors.white)
                : builder(context, index);
          }, childCount: loadingBuilder != null ? loadingCount : childCount),
        );
    }
  }
}
