import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
      ),
      height: 80,
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
      padding: const EdgeInsets.all(12),
      child: Center(
        child: IconButton(
          style: IconButton.styleFrom(
            fixedSize: Size(double.maxFinite, double.maxFinite),
            backgroundColor: Color(0xFFE3E3E3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          onPressed: () {},
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/close_icon.png',),
              const Text(
                'Отменить действие',
                style: TextStyle(
                  color: const Color(0xFF7D7D7D),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}