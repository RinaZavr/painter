import 'package:flutter/material.dart';
import 'package:painter/ui/painter/widgets/button_widget.dart';
import 'package:painter/ui/painter/widgets/info_widget.dart';
import 'package:painter/ui/painter/widgets/painter_widget.dart';

class PainterScreen extends StatefulWidget {
  const PainterScreen({super.key});

  @override
  State<PainterScreen> createState() => _PainterScreenState();
}

class _PainterScreenState extends State<PainterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        height: 40,
        decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset('assets/arrow_back.png',),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: VerticalDivider(
                color: Color(0xFFC6C6C8),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset('assets/arrow_next.png',),
            ),
          ],
        ),
      ),
      body: const Stack(
        children: [
          PainterWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoWidget(),
                ButtonWidget(),
              ],
            )),
        ],
      ),
    );
  }
}
