import 'package:flutter/material.dart';
import 'package:store_app/models/recommended_Model.dart';
import 'package:store_app/services/recommendedService.dart';
import 'package:store_app/widgets/recommendedCard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RecommendedForYouListview extends StatelessWidget {
  const RecommendedForYouListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecommendedProductModel>>(
      future: RecommendedProductService().getRecommendedProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverFillRemaining(
            child: Center(
              child: SpinKitDancingSquare(color: Colors.orange, size: 80),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text('No products available'),
            ),
          );
        } else {
          List<RecommendedProductModel> recommendedProducts = snapshot.data!;
          return SliverPadding(
            padding: const EdgeInsets.only(top: 25),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 70,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: RecommendedCard(recommendProduct: recommendedProducts[index]),
                  );
                },
                childCount: recommendedProducts.length,
              ),
            ),
          );
        }
      },
    );
  }
}
