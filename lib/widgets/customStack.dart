import 'package:flutter/material.dart';
import 'package:store_app/models/categoryModel.dart';

class CustomStack extends StatelessWidget {
  CustomStack({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.asset(
          category.image,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black,
          width: 100,
          child: Text(
            category.CategoryName,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
