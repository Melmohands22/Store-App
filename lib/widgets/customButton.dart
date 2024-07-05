import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    this.suffixIcon,
    this.onTap,
  });
  String title;
  final Widget? suffixIcon;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 32, color: Colors.black),
        )),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.orange),
      ),
    );
  }
}
