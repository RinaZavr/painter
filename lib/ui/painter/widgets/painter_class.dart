import 'dart:math';

import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  LinePainter({
    required this.points,
  });
  final List<Offset?> points;
  Path path = Path();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    // if(isFirstPoint == false && points.isNotEmpty && points[0] != null) {
    if (points.isNotEmpty && points[0] != null && points.length == 1) {
      path.moveTo(points[0]!.dx, points[0]!.dy);
    }
    for (int i = 1; i < points.length; i++) {
      if (points[i - 1] != null && points[i] != null) {
        if (i == points.length - 1 && points.length > 2 &&
              (points.first!.dx - points.last!.dx).abs() < 20 &&
              (points.first!.dy - points.last!.dy).abs() < 20) {
            path.moveTo(points[i - 1]!.dx, points[i - 1]!.dy);
            path.arcToPoint(points.first!);
            path.close();
            canvas.drawPath(path, paint);
            points.last = points.first;
            Path polygonPath = Path()..addPolygon(points as List<Offset>, true);
            canvas.drawPath(polygonPath, Paint()..color = Colors.blue);
        } else {
          path.moveTo(points[i - 1]!.dx, points[i - 1]!.dy);
          path.arcToPoint(points[i]!);
          path.close();
          canvas.drawPath(path, paint);
        }
        final TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: sqrt(pow(points[i]!.dx - points[i - 1]!.dx, 2) +
                    pow(points[i]!.dy - points[i - 1]!.dy, 2))
                .toStringAsFixed(3),
            style: const TextStyle(
              color: Color(0xFF0098EE),
            ),
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: size.width);

        canvas.save();
        double textX =
            (points[i]!.dx + points[i - 1]!.dx) / 2 + 10;
        double textY = (points[i]!.dy + points[i - 1]!.dy) / 2 - 10;
        double angleInRadians = atan2(points[i]!.dy - points[i - 1]!.dy,
            points[i]!.dx - points[i - 1]!.dx);
        double offset = 10; // расстояние между текстом и линией
  textX -= cos(angleInRadians + pi / 2) * offset; // смещение по оси X
  textY -= sin(angleInRadians + pi / 2) * offset; // смещение по оси Y
        if (angleInRadians > pi / 2 || angleInRadians < -pi / 2) {
          angleInRadians += pi;
          // textY -= textPainter.width / 2 - 20;
        }
        canvas.translate(textX, textY);
        canvas.rotate(angleInRadians);

        textPainter.paint(canvas, const Offset(0, 0));
        canvas.restore();
      }
    }

    // if (points.isNotEmpty &&
    //     points.last != null &&
    //     points.first != null &&
    //     points.length > 1 &&
    //     (points.first!.dx - points.last!.dx).abs() < 100 &&
    //     (points.first!.dy - points.last!.dy).abs() < 100) {
    //       print('OOOOOOO');
    //       Path polygonPath = Path()..addPolygon(points as List<Offset>, true);
    //       canvas.drawPath(polygonPath, Paint()..color = Colors.blue);
    //     }

    // for (int i = 0; i < points.length - 1; i++) {
    //   if (points[i] != null && points[i]?[0] != null && points[i]?[1] != null) {
    //     Path path = Path()
    //     ..moveTo(points[i]![0]!.dx, points[i]![0]!.dy)
    //     ..arcToPoint(points[i]![1]!)
    //     ..close();
    //       // ..moveTo(points[i]![0]!.dx, points[i]![0]!.dy)
    //       // ..lineTo(points[i]![1]!.dx, points[i]![1]!.dy)
    //       // ..close();
    //     paths.add(path);
    //     canvas.drawPath(path, paint);
    //     // canvas.drawLine(points[i]![0]!, points[i]![1]!,
    //     //     paint);
    //   }
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
