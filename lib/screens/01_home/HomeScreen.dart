import 'package:daangn/models/product.dart';
import 'package:daangn/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*상단 바*/
        title: Row(
          children: [
            Text("부전동"),
            SizedBox(width: 4.0),
            Icon(CupertinoIcons.chevron_down, size: 15.0)
          ],
        ),
        /* 우측 상단 아이콘, 액션 구현 X*/
        actions: [
          IconButton(icon: const Icon(CupertinoIcons.search), onPressed: () {}),
          IconButton(
              icon: const Icon(CupertinoIcons.list_dash), onPressed: () {}),
          IconButton(icon: const Icon(CupertinoIcons.bell), onPressed: () {})
        ],
        /* 앱바 하단 얇은 선? */
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5) /*이 바의 크기*/,
          child: Divider(
            thickness: 0.5 /* 선 굷기 */,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, i) {
          /* 상품 카드 */
          return PrductItem(
            product: productList[i],
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: productList.length,
      ),
    );
  }
}

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title, style: textTheme().bodyLarge),
              SizedBox(height: 5.0),
              Text("${product.address} · ${product.publishedAt}"),
              SizedBox(height: 5.0),
              Text("${numberFormat(product.price)}원"),
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
