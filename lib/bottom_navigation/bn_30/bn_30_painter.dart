import 'package:flutter/material.dart';

class Bn30Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const ratio = 2.6;
    final controllPoint = Offset(size.width / 2, -30);
    final subControllPoint = Offset(size.width - size.width / ratio, 3);

    final paint = Paint()
      ..strokeWidth = 1
      ..strokeJoin
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(size.width / ratio - 10, 5);
    path.quadraticBezierTo(size.width / ratio, 3, size.width / ratio +10, -3);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, size.width - size.width / ratio -10, -3);
    path.quadraticBezierTo(subControllPoint.dx, subControllPoint.dy, size.width - size.width / ratio +10, 3);
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      colors: [
        Colors.white,
        Colors.white,
        Colors.blue,
        Colors.white,
        Colors.white,
      ],
      stops: [0.0, 0.1, 0.5, 0.9, 1.0],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final Paint paint2 = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    
    
    final path2 = Path();
    path2.moveTo(0, 1);
    path2.lineTo(size.width / ratio -10, 5);
    path2.quadraticBezierTo(size.width / ratio, 3, size.width / ratio +10, -3);
    path2.quadraticBezierTo(controllPoint.dx, controllPoint.dy, size.width - size.width / ratio -10, -3);
    path2.quadraticBezierTo(subControllPoint.dx, subControllPoint.dy, size.width - size.width / ratio +10, 3);
    path2.lineTo(size.width, 1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
