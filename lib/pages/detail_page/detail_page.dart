import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/detail_info.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  const DetailPage(this.goodsId);

  @override
  void initState() {
  }

  void getDetailInfo(BuildContext context) async {
    var res = await Provider.of<DetailInfoProvider>(context, listen: false)
        .getGoodsInfo(goodsId);
    print('getDetailInfo => ');
    print(res);
    // Provider.of<Counter>(context, listen: false).increment();
  }

  @override
  Widget build(BuildContext context) {
    getDetailInfo(context);
    return Container(
        child: Center(
      child: Text('商品id $goodsId'),
    ));
  }
}
