import 'package:daangn/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../theme.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title, style: textTheme().bodyLarge),
          SizedBox(height: 5.0),
          Text("${product.address} · ${product.publishedAt}"),
          SizedBox(height: 5.0),
          Text(
            "${numberFormat(product.price)}원",
            style: textTheme().displayMedium,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end /* TODO : 뭐지 */,
            children: [
              Visibility(
                visible: product.commentsCount > 0 /* 0 이상 이어야 말풍선 표시 */,
                child: _buildIcons(
                  product.commentsCount,
                  CupertinoIcons.chat_bubble_2,
                ),
              ),
              const SizedBox(width: 8.0),
              Visibility(
                visible: product.heartCount > 0,
                child: _buildIcons(
                  product.heartCount,
                  CupertinoIcons.heart,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /* NumberFormat 임포트 x */
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }

  /* 아이콘과 숫자 표시*/
  Widget _buildIcons(int count, IconData iconData) {
    return Row(
      children: [
        Icon(iconData, size: 14.0),
        const SizedBox(width: 4.0),
        Text('$count'),
      ],
    );
  }
}
