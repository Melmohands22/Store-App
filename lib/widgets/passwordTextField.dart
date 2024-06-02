import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    Key? key,
    this.hintText,
    this.onChanged,
    required this.obscureText,
    this.suffixIcon,
    this.inputType,
    this.prefixIcon,
    this.color,
  }) : super(key: key);

  final String? hintText, color;
  final Function(String)? onChanged;
  bool obscureText;
  final Widget? suffixIcon;
  TextInputType? inputType;
  final Widget? prefixIcon;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Valid is required';
        }
      },
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
          icon: Icon(
            widget.obscureText ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
