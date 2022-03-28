import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const NetworkImage(
      {Key? key, required this.url, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (_, url) => _placeHolder(),
      errorWidget: (_, url, err) => _error(),
    );
  }

  Widget _placeHolder() {
    return SizedBox(
        width: width,
        height: height,
        child: CupertinoActivityIndicator(radius: min(10, width)));
  }

  Widget _error() {
    return SizedBox(
        width: width,
        height: height,
        child: Icon(
          Icons.error_outline,
          size: min(width, height),
        ));
  }
}
