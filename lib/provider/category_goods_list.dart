import 'package:flutter/material.dart';
import '../model/categoryGoodsList.dart';

class CategoryGoodsListProvider with ChangeNotifier {
  List<CategoryListData> _goodsList = [];

  get value => _goodsList;

  // 点击大类时，改变商品列表
  setGoodsList(List<CategoryListData> list) {
    _goodsList = list;
    notifyListeners();
  }
}
