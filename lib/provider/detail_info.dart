import 'package:flutter/material.dart';
import '../model/detail.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../services/api/detail.dart';

// 混入
class DetailInfoProvider with ChangeNotifier {
  DetailsModel goodsInfo = null;
  bool isLeft = true;
  bool isRight = false;

  DetailsModel get value => goodsInfo;

  changeLeftAndRight(String changgeState) {
    isLeft = changgeState == 'left';
    isRight = changgeState == 'right';
    notifyListeners();
  }

  // 从后台获取商品数据
  getGoodsInfo(String id) async {
    var params = {'goodId': id};
    Response res = await DetailApi().getGoodDetailById(params);
    var data = json.decode(res.toString());
    print(data);
    goodsInfo = DetailsModel.fromJson(data);
    notifyListeners();
    // return data;
  }
}
