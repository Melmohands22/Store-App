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
          return Center(child: SpinKitDancingSquare(color: Colors.orange, size: 80));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No products available'));
        } else {
          List<RecommendedProductModel> recommendedProducts = snapshot.data!;
          return SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 3,
                mainAxisSpacing: 80,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Recommendedcard(recommendProduct: recommendedProducts[index]);
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
