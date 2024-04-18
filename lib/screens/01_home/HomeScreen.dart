import 'package:daangn/models/product.dart';
import 'package:daangn/screens/01_home/components/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          ProductDetail(product: product)
        ],
      ),
    );
  }
}
