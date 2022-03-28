import 'package:flutter/material.dart';

class CustomAnimatedScale extends StatelessWidget {
  final Widget child;
  final double scale;

  const CustomAnimatedScale(
      {Key? key, required this.scale, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 100),
      child: child,
    );
  }
}
