import 'package:flutter/material.dart';

class CustomListItemPainter extends CustomPainter {
  CustomListItemPainter(this.isFirst, this.isLast);

  final bool isFirst;
  final bool isLast;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    const dx = 20.0;
    double dy = 23;
    const horizontalLineWidth = 20.0;

    final path = Path();
    if (isFirst) path.lineTo(size.width, 0);
    path.moveTo(dx, 0);
    path.lineTo(dx, dy);
    path.moveTo(dx, dy);
    path.lineTo(dx + horizontalLineWidth, dy);
    path.moveTo(dx, dy);
    if (!isLast) path.lineTo(dx, size.height);
    canvas.drawPath(path, paint);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
