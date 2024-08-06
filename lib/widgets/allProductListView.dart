import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/services/getAllProductService.dart';
import 'package:store_app/widgets/customCard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllProductListView extends StatelessWidget {
  const AllProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: AllProductsService().getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = snapshot.data!;
          return SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 80,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return CustomCard(product: products[index]);
                },
                childCount: products.length,
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            child: Center(
              child: SpinKitDancingSquare(
                color: Colors.orange,
                size: 80,
              ),
            ),
          );
        }
      },
    );
  }
}
