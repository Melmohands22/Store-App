import 'package:flutter/material.dart';

class customCont extends StatelessWidget {
  const customCont({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.color,
  });
  final String text;
  final double height;
  final double width;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
    );
  }
}
