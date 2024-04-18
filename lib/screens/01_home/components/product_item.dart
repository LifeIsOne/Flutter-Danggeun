import 'package:daangn/screens/01_home/components/product_detail.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/product.dart';

class PrductItem extends StatelessWidget {
  const PrductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.network(
              product.urlToImage,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15.0),
          /* 상품 티테일 */
          ProductDetail(product: product)
        ],
      ),
    );
  }
}
