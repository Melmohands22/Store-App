import 'package:flutter/material.dart';
import 'package:store_app/models/categoryModel.dart';
import 'package:store_app/widgets/categoryCard.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of categories
    final List<CategoryModel> categories = [
      CategoryModel(
          CategoryName: 'men\'s clothing',
          image: 'assets/images/e682275618d05a2410cf37b795e6f26d.jpg'),
      CategoryModel(
          CategoryName: 'women\'s clothing',
          image: 'assets/images/b2400aa8c5692dd5ca78321aff85f3c3.jpg'),
      CategoryModel(
          CategoryName: 'electronics',
          image: 'assets/images/a65779ed0acb20a5c633d435fe593151.jpg'),
      CategoryModel(
          CategoryName: 'jewelery',
          image: 'assets/images/9f3d66c19f9867531cf54b5d97804dae.jpg'),

      // Add more categories as needed
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
