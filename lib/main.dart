import 'package:flutter/material.dart';
import 'package:painter/ui/painter/screens/painter_screen.dart';
import 'package:painter/ui/painter/widgets/painter_class.dart';
import 'package:get_it/get_it.dart';

void main() {
  LinePainter painter = LinePainter(points: []);
  GetIt.instance.registerSingleton<LinePainter>(painter);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PainterScreen(),
    );
  }
}