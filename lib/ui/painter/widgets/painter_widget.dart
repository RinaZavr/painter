import 'package:flutter/material.dart';
import 'package:painter/ui/painter/widgets/painter_class.dart';

class PainterWidget extends StatefulWidget {
  const PainterWidget({super.key});

  @override
  State<PainterWidget> createState() => _PainterWidgetState();
}

class _PainterWidgetState extends State<PainterWidget> {
  // Offset? start;
  // Offset? end;
  bool isDraw = false;
  // List<List<Offset>> points = [[]];
  List<Offset> points = [];
  Offset? painterOffset;
  bool isLastPoint = false;
  List<Widget> dots = [];
  int curIndex = 0;
  bool isDrag = false;

  // LinePainter painter = LinePainter();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          onPointerDown: (event) {
            if (isLastPoint == false) {
              setState(() {
                points.add(event.position);
                painterOffset = event.position;
                isDraw = true;
                dots.add(addButton(points.length - 1));
                curIndex = points.length - 1;
                if (points.length > 2 &&
                    (points.first.dx - points.last.dx).abs() < 20 &&
                    (points.first.dy - points.last.dy).abs() < 20) {
                  painterOffset = points.first;
                  dots.remove(dots.last);
                  curIndex = 0;
                  isLastPoint = true;
                }
              });
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bg.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: CustomPaint(
              painter: LinePainter(
                points: points,
              ),
            ),
          ),
        ),
        if (dots.isNotEmpty)
          for (Widget dot in dots) dot,
        if (isDraw && painterOffset != null)
          Positioned(
            left: painterOffset!.dx - 20,
            top: painterOffset!.dy - 20,
            child: GestureDetector(
              onLongPressMoveUpdate: (details) {
                setState(() {
                  painterOffset = details.globalPosition;
                  points[curIndex] = details.globalPosition;
                  dots[curIndex] = addButton(curIndex);
                });
              },
              child: Image.asset('assets/painter.png'),
            ),
          ),
      ],
    );
  }

  Widget addButton(
      // Offset point,
      int index) {
    // if(points.isNotEmpty) {
    //   for (int i = 0; i < points.length; i++) {
    //     if(points[i].isNotEmpty) {
    // dots.add(
    return Positioned(
        left: points[index].dx - 8,
        top: points[index].dy - 8,
        // left: point.dx - 8,
        // top: point.dy - 8,
        child: GestureDetector(
          onTap: () {
            setState(() {
              // painterOffset = Offset(point.dx - 3, point.dy - 3);
              painterOffset =
                  Offset(points[index].dx - 3, points[index].dy - 3);
              curIndex = index;
            });
          },
          child: Image.asset(
            'assets/dot.png',
          ),
        ));
    // );
    //     }
    //   }
    // }
    // return dots;
  }

  // dragButton() {
  //   dots[curIndex] = addButton(curIndex);
  // }
}
