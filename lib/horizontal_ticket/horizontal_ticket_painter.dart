import 'dart:math';

import 'package:flutter/material.dart';

class HorizontalTicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1
      ..strokeJoin
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.fill;

    // final rect = Rect.fromLTWH(0,0, size.width, size.height);
    // final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(10));
    // canvas.drawRRect(rRect, paint);

    const dividerTopOffset = Offset(73, 0);
    final dividerBottomOffset = Offset(73, size.height);
    const gap = 15.0;

    final path = Path();

    path.moveTo(gap, 0);

    path.lineTo(dividerTopOffset.dx - 8, dividerTopOffset.dy);
    path.quadraticBezierTo(dividerTopOffset.dx, 15, dividerTopOffset.dx + 8, 0);
    // path.moveTo(dividerTopOffset.dx + 8, 0);

    path.lineTo(size.width - gap, 0);
    path.quadraticBezierTo(size.width, 0, size.width, gap);

    path.lineTo(size.width, size.height - gap);
    path.quadraticBezierTo(size.width, size.height, size.width - gap, size.height);

    path.lineTo(dividerBottomOffset.dx + 8, dividerBottomOffset.dy);
    path.quadraticBezierTo(dividerBottomOffset.dx, size.height - 15, dividerBottomOffset.dx - 8, dividerBottomOffset.dy);

    path.lineTo(gap, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - gap);

    const controlPoint = Offset(0, 0);
    path.lineTo(0, 15);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, 15, 0);

    canvas.drawPath(path, paint);
    drawDashLine(canvas, size, paint,dividerTopOffset);
  }

  void drawDashLine(Canvas canvas, Size size, Paint paint, Offset dividerTopOffset) {
    const dashWidth = 5.0;
    const dashSpace = 2.0;
    double startX = 73;
    double startY = 10;

    final paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(dividerTopOffset.dx, dividerTopOffset.dy + 8);  

    while (startY < size.height - 10) {
      final endY = (startY + dashWidth).clamp(0, size.height);
      canvas.drawLine(Offset(startX, startY), Offset(startX, endY.toDouble()), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
