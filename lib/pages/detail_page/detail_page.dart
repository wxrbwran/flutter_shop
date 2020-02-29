import 'package:flutter/material.dart';
import 'package:flutter_shop/model/detail.dart';
import 'package:flutter_shop/provider/detail_info.dart';
import 'package:provider/provider.dart';
import './components/top_area.dart';
import './components/detail_explain.dart';
import './components/detail_tabbar.dart';
import './components/detail_web.dart';

import 'dart:convert';

class DetailPage extends StatelessWidget {
  final String goodsId;
  const DetailPage(this.goodsId);

  @override
  void initState() {}

  Future getDetailInfo(BuildContext context) async {
    await Provider.of<DetailInfoProvider>(context, listen: false)
        .getGoodsInfo(goodsId);
    // print('getDetailInfo => ');
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    getDetailInfo(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('商品详情'),
      ),
      body: FutureBuilder(
          future: getDetailInfo(context),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: ListView(
                children: <Widget>[
                  // Text('success, $goodsId'),
                  DetailTopArea(),
                  DetailExplain(),
                  DetailTabBar(),
                  DetailWeb(),
                ],
              ));
            } else {
              return Text('loading');
            }
          }),
    );
  }
}
