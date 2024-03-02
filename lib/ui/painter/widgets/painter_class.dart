import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  LinePainter({
    required this.points
  });
  final List<List<Offset?>?> points;
  List<Path> paths = [];

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i]?[0] != null && points[i]?[1] != null) {
        Path path = Path()
        ..moveTo(points[i]![0]!.dx, points[i]![0]!.dy)
        ..arcToPoint(points[i]![1]!)
        ..close();
          // ..moveTo(points[i]![0]!.dx, points[i]![0]!.dy)
          // ..lineTo(points[i]![1]!.dx, points[i]![1]!.dy)
          // ..close();
        paths.add(path);
        canvas.drawPath(path, paint);
        // canvas.drawLine(points[i]![0]!, points[i]![1]!,
        //     paint);
      }
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}