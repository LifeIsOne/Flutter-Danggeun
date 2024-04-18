import 'package:daangn/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/product_item.dart';

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
          return PrductItem(product: productList[i]);
        },
        separatorBuilder: (context, index) => Divider(
          height: 0 /* 기본 높이가 있나 봄*/,
          indent: 16,
          endIndent: 16,
          color: Colors.grey,
        ),
        itemCount: productList.length,
      ),
    );
  }
}
