import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText,
    this.inputType,
    this.onChanged,
    this.obscureText = false,
    this.label,
    this.prefixIcon,
    this.controller,
    this.message,
  });

  final Function(String)? onChanged;
  final String? hintText;
  final TextInputType? inputType;
  final bool? obscureText;
  final dynamic label;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return message;
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText!,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: prefixIcon,
              )
            : null,
        label: label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}
