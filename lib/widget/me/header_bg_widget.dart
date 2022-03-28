import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderBgWidget extends StatelessWidget {
  final Widget child;
  final double aspectRatio;

  const HeaderBgWidget(
      {Key? key, required this.child, this.aspectRatio = 5 / 3.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _Painer(),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: child,
        ));
  }
}

class _Painer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);

    var p1 = Offset(size.width / 2, size.height);
    var p2 = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Get.theme.primaryColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
