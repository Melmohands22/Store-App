import 'package:flutter/material.dart';
import 'package:store_app/models/categoryModel.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/services/getAllCategory.dart';
import 'package:store_app/widgets/customCard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    Key? key,
  }) : super(key: key);
  static String id = 'CategoryView';

  @override
  Widget build(BuildContext context) {
    CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(category.CategoryName),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllCategoriesService().getAllCategories(category.CategoryName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 16, right: 16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 60,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CustomCard(product: products[index]);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(
              child: SpinKitDancingSquare(
                color: Colors.orange,
                size: 80,
              ),
            );
          }
        },
      ),
    );
  }
}
