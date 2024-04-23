import 'package:flutter/material.dart';

class CustomListItemPainter extends CustomPainter {
  CustomListItemPainter(this.isFirst, this.isLast);

  final bool isFirst;
  final bool isLast;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.stroke;

    const dx = 20.0;
    double dy = 23;

    final path = Path();
    if (isFirst) path.lineTo(size.width, 0);
    path.moveTo(dx, 0);
    path.lineTo(dx, dy);
    drawHorizontalLine(dx, dy, path);
    path.moveTo(dx, dy);
    if (!isLast) path.lineTo(dx, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void drawHorizontalLine(double dx, double dy,Path path){
    const horizontalLineWidth = 20.0;
    path.moveTo(dx, dy);
    path.lineTo(dx + horizontalLineWidth, dy);
  }
}
