import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatgoryView extends StatelessWidget {
  const CatgoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(slivers: [
        Container(
          color: Colors.teal,
        ),
      ]),
    ));
  }
}
