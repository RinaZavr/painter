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
  List<List<Offset>> points = [[]];
  int count = 0;
  Offset? painterOffset;
  bool isFirstPoint = false;
  List<Widget> dots = [];

  @override
  Widget build(BuildContext context) {
    print('count: $count');
    return Listener(
      onPointerDown: (event) {
        // points.add([]);
        // if (points[count].isEmpty) {
        if(isFirstPoint == false) {
          setState(() {
            points[count].add(event.position);
            painterOffset = event.position;
            isDraw = true;
            isFirstPoint = true;
            dots.add(addButton(event.position));
            if(points.isNotEmpty && points[count].isNotEmpty) print('offset: ${points[count]}');
          });
        } else {
          setState(() {
            points[count].add(event.position);
            dots.add(addButton(event.position));
            painterOffset = event.position;
            if(points.isNotEmpty && points[count].isNotEmpty) print('offset: ${points[count]}');
            count++;
            points.add([]);
            points[count].add(points[count-1][1]);
            if(points.isNotEmpty && points[count].isNotEmpty) print('offset: ${points[count]}');
          });
        }
      },
      child: Stack(
        children: [
          Container(
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
                points: points),
            ),
          ),
          if(dots.isNotEmpty)
            for(Widget dot in dots)
              dot,
          if (isDraw && painterOffset != null)
            Positioned(
              left: painterOffset!.dx - 20,
              top: painterOffset!.dy - 20,
              child: Image.asset('assets/painter.png'),
            ),
        ],
      ),
    );
  }

  Widget addButton(Offset point) {
    // if(points.isNotEmpty) {
    //   for (int i = 0; i < points.length; i++) {
    //     if(points[i].isNotEmpty) {
          // dots.add(
            return Positioned(
              left: point.dx - 8,
              top: point.dy - 8,
              child: Image.asset(
                'assets/dot.png',
              )
            );
          // );
    //     }
    //   }
    // }
    // return dots;
  }
}
