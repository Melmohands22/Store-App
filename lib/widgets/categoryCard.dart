import 'package:flutter/material.dart';
import 'package:store_app/models/categoryModel.dart';
import 'package:store_app/views/categoryView.dart';
import 'package:store_app/widgets/customStack.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
  });

  final List<CategoryModel> categories = [
    CategoryModel(
        CategoryName: 'men\'s clothing',
        image: 'assets/images/e682275618d05a2410cf37b795e6f26d.jpg'),
    CategoryModel(
        CategoryName: 'women\'s clothing',
        image: 'assets/images/b2400aa8c5692dd5ca78321aff85f3c3.jpg'),
    CategoryModel(
        CategoryName: 'jewelery',
        image: 'assets/images/9f3d66c19f9867531cf54b5d97804dae.jpg'),
    CategoryModel(
        CategoryName: 'electronics',
        image: 'assets/images/a65779ed0acb20a5c633d435fe593151.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              CategoryView.id,
              arguments: categories[index],
            );
          },
          child: CustomStack(category: categories[index]),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: categories.length,
      ),
    );
  }
}
